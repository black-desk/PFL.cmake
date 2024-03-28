cmake_minimum_required(VERSION 3.11.4..3.28.3 FATAL_ERROR)

project(
  PFLTest
  LANGUAGES CXX
  VERSION 0.1.0)

find_package(
  helloworld REQUIRED)
find_package(
  MathUtils
  COMPONENTS Core
  REQUIRED)

add_executable(test)
target_sources(
  test
  PRIVATE ./main.cpp)
target_link_libraries(
  test
  PRIVATE helloworld::helloworld MathUtils::Core)
