#Description: lwIP HTTP Daemon; user_visible: True
include_guard(GLOBAL)
message("middleware_lwip_apps_httpd component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/src/apps/http/httpd.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
)


include(middleware_lwip_apps_httpd_support)
