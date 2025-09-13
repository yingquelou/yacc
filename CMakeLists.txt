cmake_minimum_required(VERSION 3.10)

cmake_path(APPEND CMAKE_APPEND_MODULE ${CMAKE_SOURCE_DIR} cmake_module)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_APPEND_MODULE})

cmake_path(GET CMAKE_CURRENT_LIST_DIR FILENAME PROJ)
project(${PROJ})
include(router)
if(MINGW)
    add_link_options(-static)
endif()
router_directories()