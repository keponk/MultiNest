cmake_minimum_required(VERSION 2.8)
project(multinest Fortran C CXX)

# Set this to the directory in which you want MultiNest installed
SET(CMAKE_INSTALL_PREFIX /usr/local/multinest)

#=============================================================================
# All done editing
SET(MultiNest_VERSION "2.18")

SET(EXECUTABLE_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/bin)
SET(LIBRARY_OUTPUT_PATH ${CMAKE_SOURCE_DIR}/lib)

include_directories(${CMAKE_SOURCE_DIR}/includes)

add_subdirectory(src)
