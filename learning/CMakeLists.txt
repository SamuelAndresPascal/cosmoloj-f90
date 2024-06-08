cmake_minimum_required(VERSION 2.8)
project(learning)

enable_language(Fortran)

if(NOT DEFINED EXECUTABLE_OUTPUT_PATH)
    set(EXECUTABLE_OUTPUT_PATH bin/${CMAKE_BUILD_TYPE})
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
