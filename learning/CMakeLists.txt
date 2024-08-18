cmake_minimum_required(VERSION 3.22)
project(learning)

enable_language(Fortran)

if(NOT DEFINED EXECUTABLE_OUTPUT_PATH)
    set(EXECUTABLE_OUTPUT_PATH bin/${CMAKE_BUILD_TYPE})
endif()

if(NOT DEFINED CMAKE_Fortran_MODULE_DIRECTORY)
    set(CMAKE_Fortran_MODULE_DIRECTORY mod/${CMAKE_BUILD_TYPE})
endif()

file(
    GLOB
    source_files
    src/*.f90
)

foreach( source_file ${source_files} )
    get_filename_component( file_name ${source_file} NAME_WE )
    add_executable( ${file_name} ${source_file} )
endforeach( source_file ${source_files} )
