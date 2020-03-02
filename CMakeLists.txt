cmake_minimum_required(VERSION 3.10)
project(ExampleProject)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++14")

### BUILD LIBXML2 #######
execute_process (COMMAND ./autogen.sh WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/lib/libxml2)
execute_process (COMMAND make WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/lib/libxml2)
########################

file(GLOB_RECURSE HEADERS include/*.h)
file(GLOB_RECURSE SOURCES src/*.cpp)

add_library(core
    ${HEADERS}
    ${SOURCES}
)

find_package(LibXml2 REQUIRED)

include_directories(
    ${LIBXML2_INCLUDE_DIR}
)

target_include_directories(core
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/include/Formula
        ${CMAKE_CURRENT_SOURCE_DIR}/include/
)

add_executable(ExampleProject src/main.cpp)

target_link_libraries(ExampleProject
    ${CMAKE_THREAD_LIBS_INIT}
    core
    ${LIBXML2_LIBRARIES}
)

add_subdirectory(tst)
enable_testing()
add_subdirectory(lib/googletest)
