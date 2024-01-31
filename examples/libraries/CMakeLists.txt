cmake_minimum_required(VERSION 3.23)

project(
  PFLLibrariesExample
  LANGUAGES CXX
  VERSION 0.1.0)

include(./cmake/PFL.cmake)

pfl_init(ENABLE_TESTING ON BUILD_EXAMPLES ON INSTALL ON)

pfl_add_libraries(LIBS A B C)
