cmake_minimum_required(VERSION 3.11.4..3.28.3 FATAL_ERROR)

project(
  PFLTest
  LANGUAGES CXX
  VERSION 0.1.0)

find_package(
  PFLLibraryExample REQUIRED)
find_package(
  PFLLibrariesExample REQUIRED)
