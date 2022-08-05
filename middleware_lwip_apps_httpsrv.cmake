#Description: lwIP HTTP Server; user_visible: True
include_guard(GLOBAL)
message("middleware_lwip_apps_httpsrv component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
    ${CMAKE_CURRENT_LIST_DIR}/src/apps/httpsrv/httpsrv.c
    ${CMAKE_CURRENT_LIST_DIR}/src/apps/httpsrv/httpsrv_base64.c
    ${CMAKE_CURRENT_LIST_DIR}/src/apps/httpsrv/httpsrv_fs.c
    ${CMAKE_CURRENT_LIST_DIR}/src/apps/httpsrv/httpsrv_script.c
    ${CMAKE_CURRENT_LIST_DIR}/src/apps/httpsrv/httpsrv_sha1.c
    ${CMAKE_CURRENT_LIST_DIR}/src/apps/httpsrv/httpsrv_supp.c
    ${CMAKE_CURRENT_LIST_DIR}/src/apps/httpsrv/httpsrv_task.c
    ${CMAKE_CURRENT_LIST_DIR}/src/apps/httpsrv/httpsrv_tls.c
    ${CMAKE_CURRENT_LIST_DIR}/src/apps/httpsrv/httpsrv_utf8.c
    ${CMAKE_CURRENT_LIST_DIR}/src/apps/httpsrv/httpsrv_ws.c
    ${CMAKE_CURRENT_LIST_DIR}/src/apps/httpsrv/httpsrv_ws_api.c
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/src/apps/httpsrv
)

#OR Logic component
if(${MCUX_DEVICE} STREQUAL "MIMXRT1166_cm4")
    include(middleware_freertos-kernel_MIMXRT1166_cm4)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1166_cm7")
    include(middleware_freertos-kernel_MIMXRT1166_cm7)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1052")
    include(middleware_freertos-kernel_MIMXRT1052)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1064")
    include(middleware_freertos-kernel_MIMXRT1064)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC54628")
    include(middleware_freertos-kernel_LPC54628)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1021")
    include(middleware_freertos-kernel_MIMXRT1021)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1062")
    include(middleware_freertos-kernel_MIMXRT1062)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC54S018")
    include(middleware_freertos-kernel_LPC54S018)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1176_cm4")
    include(middleware_freertos-kernel_MIMXRT1176_cm4)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1176_cm7")
    include(middleware_freertos-kernel_MIMXRT1176_cm7)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC54S018M")
    include(middleware_freertos-kernel_LPC54S018M)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1024")
    include(middleware_freertos-kernel_MIMXRT1024)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT685S_cm33")
    include(middleware_freertos-kernel_MIMXRT685S_cm33)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT595S_cm33")
    include(middleware_freertos-kernel_MIMXRT595S_cm33)
endif()

include(middleware_lwip)
