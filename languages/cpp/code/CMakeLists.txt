cmake_minimum_required(VERSION 3.13)

project(codecrafters-{{course_slug}})

set(CMAKE_CXX_STANDARD 23) # Enable the C++23 standard

file(GLOB_RECURSE SOURCE_FILES src/*.cpp src/*.hpp)

add_executable({{course_slug}} ${SOURCE_FILES})