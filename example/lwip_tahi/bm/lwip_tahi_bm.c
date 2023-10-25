/*
 * Copyright (c) 2016, Freescale Semiconductor, Inc.
 * Copyright 2017-2019,2022 NXP
 * All rights reserved.
 *
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

/*******************************************************************************
 * Includes
 ******************************************************************************/

#include "lwip/opt.h"

#if LWIP_IPV6

#include "lwip/timeouts.h"
#include "lwip/init.h"
#include "lwip/sys.h"
#include "netif/ethernet.h"
#include "ethernetif.h"

#include "board.h"
#include "app.h"
#include "fsl_silicon_id.h"

#include "fsl_shell.h"
#include "fsl_uart.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/

#ifndef EXAMPLE_NETIF_INIT_FN
/*! @brief Network interface initialization function. */
#define EXAMPLE_NETIF_INIT_FN ethernetif0_init
#endif /* EXAMPLE_NETIF_INIT_FN */

#define shell_printf PRINTF
#define SHELL_PROMPT "shell> "
#define INIT_DELAY   (10000U)

/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*******************************************************************************
 * Variables
 ******************************************************************************/

static struct netif netif;
static uart_handle_t uart_handle;
static volatile bool uart_rx_done;
static volatile status_t uart_rx_status;

/*******************************************************************************
 * Code
 ******************************************************************************/

/*!
 * @brief Interrupt service for SysTick timer.
 */
void SysTick_Handler(void)
{
    time_isr();
}

static void busy_wait(const uint32_t milliseconds)
{
    uint32_t begin = sys_now();
    uint32_t end   = begin + milliseconds;

    if (end < begin)
    {
        while (sys_now() > begin)
        {
        }
    }

    while (sys_now() < end)
    {
    }
}

static void configure_lwip_once(void)
{
    static bool lwipConfigured = false;

    if (lwipConfigured)
    {
        return;
    }

    lwipConfigured = true;

    ethernetif_config_t enet_config = {
        .phyAddress = EXAMPLE_PHY_ADDRESS,
        .clockName  = EXAMPLE_CLOCK_NAME,
#ifdef configMAC_ADDR
        .macAddress = configMAC_ADDR,
#endif
    };

#ifndef configMAC_ADDR
    /* Set special address for each chip. */
    (void)SILICONID_ConvertToMacAddr(&enet_config.macAddress);
#endif

    shell_printf("\r\ninitializing network interface\r\n");

    netif_add(&netif, &enet_config, EXAMPLE_NETIF_INIT_FN, ethernet_input);

    netif_create_ip6_linklocal_address(&netif, 1);
    netif_ip6_addr_set_state(&netif, 0, IP6_ADDR_TENTATIVE);
    netif.ip6_autoconfig_enabled = 1;

    netif_set_default(&netif);
    netif_set_up(&netif);

    shell_printf("IPv6 address: %s\r\n", ipaddr_ntoa(netif_ip_addr6(&netif, 0)));
    shell_printf(SHELL_PROMPT);
}

static int32_t command_reboot(p_shell_context_t context, int32_t argc, char **argv)
{
    shell_printf("rebooting\r\n\r\n");

    netif_set_down(&netif);

    /* Wait to make sure the print is not terminated by reset prematurely:
     *   after shell_printf() return, some characters are still in output registers. */
    busy_wait(20U);

    NVIC_SystemReset();

    return 0;
}

static void shell_send_data(uint8_t *buf, uint32_t len)
{
    while (len--)
    {
        PUTCHAR(*(buf++));
    }
}

static void uart_rx_callback(UART_Type *base, uart_handle_t *handle, status_t status, void *userData)
{
    uart_rx_status = status;
    uart_rx_done   = true;
}

static void shell_receive_data(uint8_t *buf, uint32_t len)
{
    uart_transfer_t xfer = {buf, len};
    size_t receivedBytes;

    configure_lwip_once();

    do
    {
        uart_rx_status = kStatus_UART_RxBusy;
        uart_rx_done   = false;
        UART_TransferReceiveNonBlocking(EXAMPLE_SHELL_UART, &uart_handle, &xfer, &receivedBytes);

        while (!uart_rx_done)
        {
            /* Poll ENET input and handle lwIP timeouts */
            ethernetif_input(&netif);
            sys_check_timeouts();
        }
    } while (uart_rx_status != kStatus_UART_RxIdle);
}

static void shell_run()
{
    shell_context_struct shell_context;
    const shell_command_context_t reboot_command = {"reboot", "\r\n\"reboot\": Resets the device\r\n", &command_reboot,
                                                    0U};

    /* Initialize handle for asynchronous UART shell input */
    UART_TransferCreateHandle(EXAMPLE_SHELL_UART, &uart_handle, uart_rx_callback, NULL);

    /* Init SHELL */
    SHELL_Init(&shell_context, shell_send_data, shell_receive_data, shell_printf, SHELL_PROMPT);

    /* Add shell command */
    SHELL_RegisterCommand(&reboot_command);

    /* Run shell loop until exited */
    SHELL_Main(&shell_context);
}

/*!
 * @brief Main function.
 */
int main(void)
{
    BOARD_InitHardware();

    time_init();
    lwip_init();

    shell_printf("starting lwIP TAHI bm application\r\n");
    shell_printf("sleep %u ms\r\n", INIT_DELAY);

    busy_wait(INIT_DELAY);

    shell_run();

    while (1)
    {
    }
}
#endif /* LWIP_IPV6 */
