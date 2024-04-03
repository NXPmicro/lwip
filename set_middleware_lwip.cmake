include_guard(GLOBAL)


if (CONFIG_USE_middleware_lwip_template)
# Add set(CONFIG_USE_middleware_lwip_template true) in config.cmake to use this component

message("middleware_lwip_template component is included from ${CMAKE_CURRENT_LIST_FILE}.")

add_config_file(${CMAKE_CURRENT_LIST_DIR}/./template/lwipopts.h ${CMAKE_CURRENT_LIST_DIR}/./template middleware_lwip_template)


endif()


if (CONFIG_USE_middleware_lwip_empty_ethernetif)
# Add set(CONFIG_USE_middleware_lwip_empty_ethernetif true) in config.cmake to use this component

message("middleware_lwip_empty_ethernetif component is included from ${CMAKE_CURRENT_LIST_FILE}.")

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./port
)


endif()


if (CONFIG_USE_middleware_lwip)
# Add set(CONFIG_USE_middleware_lwip true) in config.cmake to use this component

message("middleware_lwip component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_lwip_template AND (CONFIG_USE_middleware_lwip_usb_ethernetif OR CONFIG_USE_middleware_lwip_kinetis_ethernetif OR CONFIG_USE_middleware_lwip_empty_ethernetif OR CONFIG_USE_middleware_lwip_eoe_ethernetif OR CONFIG_USE_middleware_wifi))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./port/sys_arch.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/api/api_lib.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/api/api_msg.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/api/err.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/api/if_api.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/api/netbuf.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/api/netdb.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/api/netifapi.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/api/sockets.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/api/tcpip.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/altcp.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/altcp_alloc.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/altcp_tcp.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/def.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/dns.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/inet_chksum.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/init.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ip.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ipv4/acd.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ipv4/autoip.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ipv4/dhcp.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ipv4/etharp.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ipv4/icmp.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ipv4/igmp.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ipv4/ip4.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ipv4/ip4_addr.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ipv4/ip4_frag.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ipv6/dhcp6.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ipv6/ethip6.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ipv6/icmp6.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ipv6/inet6.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ipv6/ip6.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ipv6/ip6_addr.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ipv6/ip6_frag.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ipv6/mld6.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/ipv6/nd6.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/mem.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/memp.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/netif.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/pbuf.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/raw.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/stats.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/sys.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/tcp.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/tcp_in.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/tcp_out.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/timeouts.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/core/udp.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/bridgeif.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/bridgeif_fdb.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ethernet.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/lowpan6.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/lowpan6_ble.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/lowpan6_common.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/slipif.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/zepif.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/auth.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/ccp.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/chap-md5.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/chap-new.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/chap_ms.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/demand.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/eap.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/ecp.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/eui64.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/fsm.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/ipcp.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/ipv6cp.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/lcp.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/magic.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/mppe.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/multilink.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/ppp.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/pppapi.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/pppcrypt.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/pppoe.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/pppol2tp.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/pppos.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/upap.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/utils.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/netif/ppp/vj.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./port
  ${CMAKE_CURRENT_LIST_DIR}/./src
  ${CMAKE_CURRENT_LIST_DIR}/./src/include
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  if(CONFIG_TOOLCHAIN STREQUAL armgcc)
    target_compile_options(${MCUX_SDK_PROJECT_NAME} PUBLIC
    )
  endif()

endif()

else()

message(SEND_ERROR "middleware_lwip dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_lwip_kinetis_ethernetif)
# Add set(CONFIG_USE_middleware_lwip_kinetis_ethernetif true) in config.cmake to use this component

message("middleware_lwip_kinetis_ethernetif component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_lwip AND CONFIG_USE_middleware_lwip_template AND CONFIG_USE_driver_phy-common AND CONFIG_USE_driver_enet AND (CONFIG_USE_component_lpc_gpio_adapter OR CONFIG_USE_component_gpio_adapter))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./port/enet_ethernetif.c
  ${CMAKE_CURRENT_LIST_DIR}/./port/ethernetif.c
  ${CMAKE_CURRENT_LIST_DIR}/./port/ethernetif_mmac.c
  ${CMAKE_CURRENT_LIST_DIR}/./port/enet_ethernetif_kinetis.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./port
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DLWIP_DISABLE_PBUF_POOL_SIZE_SANITY_CHECKS=1
    -DCHECKSUM_GEN_ICMP6=1
    -DCHECKSUM_CHECK_ICMP6=1
  )

endif()

else()

message(SEND_ERROR "middleware_lwip_kinetis_ethernetif dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_lwip_eoe_ethernetif)
# Add set(CONFIG_USE_middleware_lwip_eoe_ethernetif true) in config.cmake to use this component

message("middleware_lwip_eoe_ethernetif component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_lwip AND CONFIG_USE_middleware_lwip_template AND CONFIG_USE_middleware_freertos-kernel)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./port/eoe_ethernetif.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./port
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DCHECKSUM_GEN_IP=1
    -DCHECKSUM_GEN_UDP=1
    -DCHECKSUM_GEN_TCP=1
    -DCHECKSUM_GEN_ICMP=1
    -DCHECKSUM_CHECK_ICMP=1
  )

endif()

else()

message(SEND_ERROR "middleware_lwip_eoe_ethernetif dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_lwip_usb_ethernetif)
# Add set(CONFIG_USE_middleware_lwip_usb_ethernetif true) in config.cmake to use this component

message("middleware_lwip_usb_ethernetif component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_lwip AND CONFIG_USE_middleware_usb_host_cdc AND CONFIG_USE_middleware_usb_host_cdc_rndis AND (CONFIG_USE_middleware_usb_host_ehci))

if(CONFIG_USE_middleware_baremetal)
  target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
      ${CMAKE_CURRENT_LIST_DIR}/./port/usb_ethernetif_bm.c
  )
endif()

if(CONFIG_USE_middleware_freertos-kernel)
  target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
      ${CMAKE_CURRENT_LIST_DIR}/./port/usb_ethernetif_freertos.c
  )
endif()

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./port
)

else()

message(SEND_ERROR "middleware_lwip_usb_ethernetif dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_lwip_apps_httpd_support)
# Add set(CONFIG_USE_middleware_lwip_apps_httpd_support true) in config.cmake to use this component

message("middleware_lwip_apps_httpd_support component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_lwip)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/http/fs.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/http
  ${CMAKE_CURRENT_LIST_DIR}/./src/include/lwip/apps
)

else()

message(SEND_ERROR "middleware_lwip_apps_httpd_support dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_lwip_apps_httpd)
# Add set(CONFIG_USE_middleware_lwip_apps_httpd true) in config.cmake to use this component

message("middleware_lwip_apps_httpd component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_lwip AND CONFIG_USE_middleware_lwip_apps_httpd_support)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/http/httpd.c
)

else()

message(SEND_ERROR "middleware_lwip_apps_httpd dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_lwip_apps_httpsrv)
# Add set(CONFIG_USE_middleware_lwip_apps_httpsrv true) in config.cmake to use this component

message("middleware_lwip_apps_httpsrv component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_lwip AND CONFIG_USE_middleware_freertos-kernel)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/httpsrv/httpsrv.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/httpsrv/httpsrv_base64.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/httpsrv/httpsrv_fs.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/httpsrv/httpsrv_script.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/httpsrv/httpsrv_sha1.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/httpsrv/httpsrv_supp.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/httpsrv/httpsrv_task.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/httpsrv/httpsrv_tls.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/httpsrv/httpsrv_utf8.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/httpsrv/httpsrv_ws.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/httpsrv/httpsrv_ws_api.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/httpsrv
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DUSE_RTOS=1
  )

endif()

else()

message(SEND_ERROR "middleware_lwip_apps_httpsrv dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_lwip_apps_httpssrv)
# Add set(CONFIG_USE_middleware_lwip_apps_httpssrv true) in config.cmake to use this component

message("middleware_lwip_apps_httpssrv component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_lwip_apps_httpsrv AND CONFIG_USE_middleware_mbedtls)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/httpsrv
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DMBEDTLS_THREADING_C
    -DMBEDTLS_THREADING_ALT
  )

endif()

else()

message(SEND_ERROR "middleware_lwip_apps_httpssrv dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_lwip_apps_mdns)
# Add set(CONFIG_USE_middleware_lwip_apps_mdns true) in config.cmake to use this component

message("middleware_lwip_apps_mdns component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_lwip)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/mdns/mdns.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/mdns/mdns_domain.c
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/mdns/mdns_out.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./src/include/lwip/apps
)

else()

message(SEND_ERROR "middleware_lwip_apps_mdns dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_lwip_apps_lwiperf)
# Add set(CONFIG_USE_middleware_lwip_apps_lwiperf true) in config.cmake to use this component

message("middleware_lwip_apps_lwiperf component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_lwip AND (CONFIG_USE_middleware_freertos-kernel OR CONFIG_USE_middleware_baremetal))

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/lwiperf/lwiperf.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./src/include/lwip/apps
)

if(CONFIG_USE_COMPONENT_CONFIGURATION)
  message("===>Import configuration from ${CMAKE_CURRENT_LIST_FILE}")

  target_compile_definitions(${MCUX_SDK_PROJECT_NAME} PUBLIC
    -DSO_REUSE=1
  )

endif()

else()

message(SEND_ERROR "middleware_lwip_apps_lwiperf dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_lwip_apps_mqtt)
# Add set(CONFIG_USE_middleware_lwip_apps_mqtt true) in config.cmake to use this component

message("middleware_lwip_apps_mqtt component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_lwip)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/mqtt/mqtt.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./src/include/lwip/apps
)

else()

message(SEND_ERROR "middleware_lwip_apps_mqtt dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_lwip_apps_sntp)
# Add set(CONFIG_USE_middleware_lwip_apps_sntp true) in config.cmake to use this component

message("middleware_lwip_apps_sntp component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_lwip)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./src/apps/sntp/sntp.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./src/include/lwip/apps
)

else()

message(SEND_ERROR "middleware_lwip_apps_sntp dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_lwip_contrib_ping)
# Add set(CONFIG_USE_middleware_lwip_contrib_ping true) in config.cmake to use this component

message("middleware_lwip_contrib_ping component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_lwip)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./contrib/apps/ping/ping.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./contrib/apps/ping
)

else()

message(SEND_ERROR "middleware_lwip_contrib_ping dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_lwip_contrib_tcpecho)
# Add set(CONFIG_USE_middleware_lwip_contrib_tcpecho true) in config.cmake to use this component

message("middleware_lwip_contrib_tcpecho component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_lwip)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./contrib/apps/tcpecho/tcpecho.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./contrib/apps/tcpecho
)

else()

message(SEND_ERROR "middleware_lwip_contrib_tcpecho dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_lwip_contrib_tcpecho_raw)
# Add set(CONFIG_USE_middleware_lwip_contrib_tcpecho_raw true) in config.cmake to use this component

message("middleware_lwip_contrib_tcpecho_raw component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_lwip)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./contrib/apps/tcpecho_raw/tcpecho_raw.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./contrib/apps/tcpecho_raw
)

else()

message(SEND_ERROR "middleware_lwip_contrib_tcpecho_raw dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_lwip_contrib_udpecho)
# Add set(CONFIG_USE_middleware_lwip_contrib_udpecho true) in config.cmake to use this component

message("middleware_lwip_contrib_udpecho component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_lwip)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./contrib/apps/udpecho/udpecho.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./contrib/apps/udpecho
)

else()

message(SEND_ERROR "middleware_lwip_contrib_udpecho dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()


if (CONFIG_USE_middleware_lwip_contrib_udpecho_raw)
# Add set(CONFIG_USE_middleware_lwip_contrib_udpecho_raw true) in config.cmake to use this component

message("middleware_lwip_contrib_udpecho_raw component is included from ${CMAKE_CURRENT_LIST_FILE}.")

if(CONFIG_USE_middleware_lwip)

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
  ${CMAKE_CURRENT_LIST_DIR}/./contrib/apps/udpecho_raw/udpecho_raw.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
  ${CMAKE_CURRENT_LIST_DIR}/./contrib/apps/udpecho_raw
)

else()

message(SEND_ERROR "middleware_lwip_contrib_udpecho_raw dependency does not meet, please check ${CMAKE_CURRENT_LIST_FILE}.")

endif()

endif()

