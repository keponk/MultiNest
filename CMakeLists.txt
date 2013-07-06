cmake_minimum_required(VERSION 2.8)
project(multinest Fortran C CXX)

#=============================================================================
# All done editing
SET(MultiNest_VERSION "3.0")

SET(EXECUTABLE_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/bin)
SET(LIBRARY_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/lib)

include_directories(${CMAKE_SOURCE_DIR}/include)

add_subdirectory(src)
