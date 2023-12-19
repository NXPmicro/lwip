#Description: lwIP Adaptation for USB Network Layer; user_visible: True
include_guard(GLOBAL)
message("middleware_lwip_usb_ethernetif component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
)

#OR Logic component
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

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/port
)


include(middleware_lwip_MIMXRT1062)
include(middleware_usb_host_cdc_rndis)
include(middleware_usb_host_ehci_MIMXRT1062)
