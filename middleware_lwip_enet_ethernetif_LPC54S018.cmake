#Description: Enet ethernet interface; user_visible: True
include_guard(GLOBAL)
message("middleware_lwip_enet_ethernetif component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/enet_ethernetif.c
    ${CMAKE_CURRENT_LIST_DIR}/port/ethernetif.c
    ${CMAKE_CURRENT_LIST_DIR}/port/ethernetif_mmac.c
)

#OR Logic component
if(CONFIG_USE_driver_lpc_enet)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/enet_ethernetif_lpc.c
)
endif()

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/port
)


include(middleware_lwip_LPC54S018)
include(driver_phy-common_LPC54S018)
include(driver_lpc_enet)
