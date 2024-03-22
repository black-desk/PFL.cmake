cmake_minimum_required(VERSION 3.11.4..3.28.3 FATAL_ERROR)

project(
  PFLLibrariesExample
  LANGUAGES CXX
  VERSION 0.1.0)

include(./cmake/PFL.cmake)

pfl_init(ENABLE_TESTING ON BUILD_EXAMPLES ON INSTALL ON)

pfl_add_libraries(LIBS A B C)
