pfl_add_library(
  MERGED_HEADER_PLACEMENT
  OUTPUT_NAME
  MathUtilsCore
  SOVERSION
  0
  SOURCES
  ./src/MathUtils/Core/add.cxx
  ./src/MathUtils/Core/add.hpp
  LINK_LIBRARIES
  PRIVATE
  m # not really used, just to test target_link_libraries work
)
