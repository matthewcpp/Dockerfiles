cmake_minimum_required(VERSION 3.16)
project(snd2aiff C)

include(${CMAKE_BINARY_DIR}/conan_paths.cmake)

find_package(SndFile REQUIRED)

add_executable(snd2aiff main.c)

target_link_libraries(snd2aiff SndFile::SndFile)

