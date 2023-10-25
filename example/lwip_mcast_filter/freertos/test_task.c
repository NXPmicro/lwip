#include "lwip/sys.h"
#include "lwip/netif.h"
#include "lwip/sockets.h"
#include "fsl_debug_console.h"

#include "test_task.h"

#define TEST_TASK_STACK_SIZE 1024

static int s_sock           = -1;
static char *mcastGroups[6] = {"ff02::10", "ff02::13", "ff02::14", "ff02::15", "ff02::17", "ff02::18"};

static bool sock_create(void)
{
    s_sock = socket(AF_INET6, SOCK_DGRAM, 0);
    if (s_sock == -1)
    {
        PRINTF("failed: socket, %d", s_sock);
        return false;
    }

    struct sockaddr_in6 addr = {
        .sin6_len      = sizeof(struct sockaddr_in6),
        .sin6_family   = AF_INET6,
        .sin6_port     = htons(9000),
        .sin6_scope_id = 1,
    };
    int ret = bind(s_sock, (struct sockaddr *)&addr, sizeof(struct sockaddr_in6));
    if (ret != 0)
    {
        PRINTF("failed: bind, %d", ret);
        return false;
    }

    return true;
}

void test_task(void *arg)
{
    PRINTF("Creating socket... ");
    if (!sock_create())
        goto End;
    else
        PRINTF("OK\r\n");

    PRINTF("Following multicast groups are available: \r\n");
    for (size_t i = 0; i < 6; i++)
        PRINTF("- (%c) %s\r\n", (char)(i + 'A'), mcastGroups[i]);

    while (true)
    {
        int action;
        while (true)
        {
            PRINTF("Action (+: join, -: leave) > ");
            char ch = GETCHAR();
            PUTCHAR(ch);
            PRINTF("\r\n");

            if (ch != '+' && ch != '-')
            {
                PRINTF("Invalid input.\r\n");
                continue;
            }

            action = ch == '+' ? IPV6_ADD_MEMBERSHIP : IPV6_DROP_MEMBERSHIP;
            break;
        }

        size_t idx;
        while (true)
        {
            PRINTF("Group index (A - F) > ");
            char ch = GETCHAR();
            PUTCHAR(ch);
            PRINTF("\r\n");

            if (ch < 'A' || ch > 'F')
            {
                PRINTF("Invalid input.\r\n");
                continue;
            }

            idx = ch - 'A';
            break;
        }

        int ret;
        ipv6_mreq mreq = {.ipv6mr_interface = 1};
        if ((ret = inet_pton(AF_INET6, mcastGroups[idx], &mreq.ipv6mr_multiaddr)) != 1)
        {
            PRINTF("failed: inet_pton, %d \r\n", ret);
            continue;
        }
        if ((ret = setsockopt(s_sock, IPPROTO_IPV6, action, &mreq, sizeof(mreq))) != 0)
        {
            PRINTF("failed: setsockopt, %d \r\n", ret);
            continue;
        }

        PRINTF("OK\r\n");
    }

End:
    vTaskDelete(NULL);
}

void test_task_create(void)
{
    if (sys_thread_new("test", test_task, NULL, TEST_TASK_STACK_SIZE, DEFAULT_THREAD_PRIO) == NULL)
    {
        LWIP_ASSERT("shell_task_init(): Task creation failed.\r\n", 0);
    }
}
