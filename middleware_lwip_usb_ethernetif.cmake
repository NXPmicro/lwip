#Description: lwIP Adaptation for USB Network Layer; user_visible: True
include_guard(GLOBAL)
message("middleware_lwip_usb_ethernetif component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
)

#OR Logic component
if(CONFIG_USE_middleware_baremetal)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_bm.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_MIMXRT1166_cm7)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_MIMXRT1052)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_baremetal_LPC54S016)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_bm.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_LPC54S016)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_baremetal_LPC54606)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_bm.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_LPC54606)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_baremetal_LPC54616)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_bm.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_LPC54616)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_baremetal_LPC54016)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_bm.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_LPC54016)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_baremetal_LPC54018)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_bm.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_LPC54018)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_LPC54628)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_baremetal_MIMXRT1173_cm7)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_bm.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_MIMXRT1173_cm7)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_baremetal_MIMXRT1051)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_bm.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_MIMXRT1051)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_baremetal_LPC54618)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_bm.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_LPC54618)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_MIMXRT1021)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_MIMXRT1062)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_LPC54S018)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_MIMXRT1042)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_MIMXRT1176_cm7)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_baremetal_MIMXRT1175_cm7)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_bm.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_MIMXRT1175_cm7)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_baremetal_MIMXRT1061)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_bm.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_MIMXRT1061)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_baremetal_MIMXRT1165_cm7)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_bm.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_MIMXRT1165_cm7)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_MIMXRT1024)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

if(CONFIG_USE_middleware_baremetal_LPC54608)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_bm.c
)
endif()

if(CONFIG_USE_middleware_freertos-kernel_LPC54608)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/usb_ethernetif_freertos.c
)
endif()

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/port
)

#OR Logic component
if(${MCUX_DEVICE} STREQUAL "MIMXRT1166_cm7")
    include(middleware_usb_host_ehci_MIMXRT1166_cm7)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1052")
    include(middleware_usb_host_ehci_MIMXRT1052)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC54S016")
    include(middleware_usb_host_ohci)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC54606")
    include(middleware_usb_host_ohci)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC54616")
    include(middleware_usb_host_ohci)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC54016")
    include(middleware_usb_host_ohci)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC54018")
    include(middleware_usb_host_ohci)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC54628")
    include(middleware_usb_host_ohci)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1173_cm7")
    include(middleware_usb_host_ehci_MIMXRT1176_cm7)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1051")
    include(middleware_usb_host_ehci_MIMXRT1052)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC54618")
    include(middleware_usb_host_ohci)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1021")
    include(middleware_usb_host_ehci_MIMXRT1021)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1062")
    include(middleware_usb_host_ehci_MIMXRT1062)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC54S018")
    include(middleware_usb_host_ohci)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1042")
    include(middleware_usb_host_ehci_MIMXRT1042)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1176_cm7")
    include(middleware_usb_host_ehci_MIMXRT1176_cm7)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1175_cm7")
    include(middleware_usb_host_ehci_MIMXRT1176_cm7)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1061")
    include(middleware_usb_host_ehci_MIMXRT1062)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1165_cm7")
    include(middleware_usb_host_ehci_MIMXRT1166_cm7)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1024")
    include(middleware_usb_host_ehci_MIMXRT1024)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC54608")
    include(middleware_usb_host_ohci)
endif()

include(middleware_lwip)
include(middleware_usb_host_cdc_rndis)
