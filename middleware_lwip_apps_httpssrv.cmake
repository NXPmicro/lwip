#Description: lwIP HTTPS Server; user_visible: True
include_guard(GLOBAL)
message("middleware_lwip_apps_httpssrv component is included.")

target_sources(${MCUX_SDK_PROJECT_NAME} PRIVATE
)

target_include_directories(${MCUX_SDK_PROJECT_NAME} PUBLIC
    ${CMAKE_CURRENT_LIST_DIR}/src/apps/httpsrv
)

#OR Logic component
if(${MCUX_DEVICE} STREQUAL "MIMXRT1166_cm4")
    include(middleware_mbedtls_MIMXRT1166_cm4)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1166_cm7")
    include(middleware_mbedtls_MIMXRT1166_cm7)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1052")
    include(middleware_mbedtls_MIMXRT1052)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1064")
    include(middleware_mbedtls_MIMXRT1064)
endif()
if(${MCUX_DEVICE} STREQUAL "LPC54628")
    include(middleware_mbedtls_LPC54628)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1062")
    include(middleware_mbedtls_MIMXRT1062)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1042")
    include(middleware_mbedtls_MIMXRT1042)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1176_cm4")
    include(middleware_mbedtls_MIMXRT1176_cm4)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT1176_cm7")
    include(middleware_mbedtls_MIMXRT1176_cm7)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT685S_cm33")
    include(middleware_mbedtls_MIMXRT685S_cm33)
endif()
if(${MCUX_DEVICE} STREQUAL "MIMXRT595S_cm33")
    include(middleware_mbedtls_MIMXRT595S_cm33)
endif()

include(middleware_lwip_apps_httpsrv)
