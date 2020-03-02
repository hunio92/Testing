cmake_minimum_required(VERSION 3.5)

project(run_tst)

file(GLOB_RECURSE TST_SOURCES *.cpp)

add_executable(run_tst ${TST_SOURCES})

target_link_libraries(run_tst PUBLIC 
    gtest
    core
)

add_test(
    NAME run_tst
    COMMAND run_tst
)