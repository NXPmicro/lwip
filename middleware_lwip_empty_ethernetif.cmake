#Description: lwIP Empty Ethernet Layer (do not use); user_visible: True
include_guard(GLOBAL)
message("middleware_lwip_empty_ethernetif component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
)


include(middleware_lwip)
