pfl_add_library(
  MERGED_HEADER_PLACEMENT
  OUTPUT_NAME
  MathUtilsCore
  SOVERSION
  0
  SOURCES
  ./src/MathUtils/Core/add.cxx
  ./src/MathUtils/Core/add.hpp
  DEPENDENCIES
  PUBLIC
  "helloworld REQUIRED"
  LINK_LIBRARIES
  PRIVATE
  helloworld::helloworld)
