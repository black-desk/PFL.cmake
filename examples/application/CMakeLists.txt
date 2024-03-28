cmake_minimum_required(VERSION 3.11.4 FATAL_ERROR)

project(
  helloworld
  LANGUAGES CXX
  VERSION 0.1.0)

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
include(PFL)

pfl_init(AUTO)
pfl_add_executable(SOURCES src/main.cpp)
