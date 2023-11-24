project(
  PFL.cmake
  VERSION 0.2.5
  DESCRIPTION
    "PFL.cmake is a cmake module to quickly compile c++ project follow the pintchfork layout."
  HOMEPAGE_URL "https://github.com/black-desk/PFL.cmake")

configure_file(./cmake/PFL.cmake.in)
include(${CMAKE_BINARY_DIR}/cmake/PFL.cmake)

pfl()

include(CTest)
