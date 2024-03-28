# PFL_add_excutable

This function is used to add an executable.
You should call this function
if `${CMAKE_CURRENT_SOURCE_DIR}/src` contains the source code
of your executable file.

For examples you could use this function to add applications, examples and test.

## Argument

- *string* `LIBEXEC`
  If this option is set,
  executable will be installed to `${CMAKE_INSTALL_LIBEXECDIR}/${LIBEXEC}` dir.
- *string* `OUTPUT_NAME`
  The output file name of your executable.
- *list* `LINK_LIBRARIES`
  Arguments passed to target_link_libraries.
- *list* `COMPILE_FEATURES`
  Arguments passed to target_compile_features.
- *list* `SOURCES`
  List of source files, include .in, sources and headers.
  We support add (possibly near-empty) cpp files
  as sources of header only library to check if that header is self-contained.
- *option* `DISABLE_INSTALL`

## Example

Check [examples](https://github.com/black-desk/PFL.cmake/tree/master/examples)
online.
