#Description: Enet ethernet interface; user_visible: True
include_guard(GLOBAL)
message("middleware_lwip_enet_ethernetif component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/enet_ethernetif.c
)

#OR Logic component
if(CONFIG_USE_driver_enet)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/enet_ethernetif_kinetis.c
)
endif()

if(CONFIG_USE_driver_enet_qos)
target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/port/enet_ethernetif_qos.c
)
endif()

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/port
)

#OR Logic component
if(CONFIG_USE_driver_enet_qos) 
    include(driver_enet_qos)
endif()
if(CONFIG_USE_driver_enet) 
    include(driver_enet)
endif()

include(middleware_lwip)
include(driver_phy-common)
