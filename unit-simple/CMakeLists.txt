cmake_minimum_required(VERSION 3.22)
project(simple-unit)

enable_language(Fortran)

if(NOT DEFINED EXECUTABLE_OUTPUT_PATH)
    set(EXECUTABLE_OUTPUT_PATH bin/${CMAKE_BUILD_TYPE})
endif()

if(NOT DEFINED LIBRARY_OUTPUT_PATH)
    set(LIBRARY_OUTPUT_PATH lib/${CMAKE_BUILD_TYPE})
endif()

if(NOT DEFINED CMAKE_Fortran_MODULE_DIRECTORY)
    set(CMAKE_Fortran_MODULE_DIRECTORY mod/${CMAKE_BUILD_TYPE})
endif()

file(
    GLOB
    source_files
    src/*
)

add_library(
    simple-unit
    SHARED
    ${source_files}
)

add_executable(
    demo
    demo/demo.f90
)

target_link_libraries(
    demo
    simple-unit
)

