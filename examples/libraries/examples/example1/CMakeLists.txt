pfl_add_executable(
  DISABLE_INSTALL
  OUTPUT_NAME
  example1
  SOURCES
  ./src/main.cpp
  LINK_LIBRARIES
  PRIVATE
  MathUtils::Core
  MathUtils::Internal)
