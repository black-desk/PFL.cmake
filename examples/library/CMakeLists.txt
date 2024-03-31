cmake_minimum_required(VERSION 3.11.4 FATAL_ERROR)

project(
  helloworld
  LANGUAGES CXX
  VERSION 0.1.0)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
include(PFL)

pfl_init()

pfl_add_library(
  SOURCES include/helloworld/lib.hpp src/helloworld/configure.hpp.in
  src/helloworld/lib.cpp APPS helloworld_with_lib)
