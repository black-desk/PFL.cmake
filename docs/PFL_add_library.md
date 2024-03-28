# PFL_add_library

This function is used to add a library,
target name of the library added is
`${PROJECT_NAME}::` + current source directory name.
This target will be an alias target.

PFL.cmake will automatically generate a `*Config.cmake` file for your library.

## Arguments

- *option* `DISABLE_INSTALL`
- *string* `LIBRARY_TYPE`
  `STATIC`, `SHARED` or `HEADER_ONLY`.
  If no `LIBRARY_TYPE` is given the default is STATIC or SHARED
  based on the value of the BUILD_SHARED_LIBS variable.
  If not specified, cmake will automatically decide to build a static
- *string* `OUTPUT_NAME`
  The output file name of this library.
- *string* `VERSION`
  The version of this library.
- *string* `SOVERSION`
  The soversion of this library.
  **NOT** available for `HEADER_ONLY` and `STATIC` library.
- *list* `SOURCES`
  List of source files, include .in, sources and headers.
  We support add (possibly near-empty) cpp files
  as sources of header only library to check if that header is self-contained.
- *list* `TESTS`
  Directories in `/tests` that contain source code of tests.
  If test targets is enabled in your project,
  which can be done by set `ENABLE_TESTING` to true when call `PFL_init`,
  PFL.cmake will call add_subdirectory on these directory in order.
- *list* `APPS`
  Directories in `/apps` that contain source code of application.
  If application targets is enabled in your project,
  which can be done by set `ENABLE_APPLICATION` to true when call `PFL_init`,
  PFL.cmake will call add_subdirectory on these directory in order.
- *list* `EXAMPLES`
  Directories in `/examples` that contain source code of examples.
  If example targets is enabled in your project,
  which can be done by set `ENABLE_EXAMPLE` to true when call `PFL_init`,
  PFL.cmake will call add_subdirectory on these directory in order.
- *list* `LINK_LIBRARIES`
  Arguments passed to target_link_libraries.
- *list* `COMPILE_FEATURES`
  Arguments passed to target_compile_features.
- *list* `FIND_DEPENDENCY_ARGUMENTS`
  Arguments pass to `find_dependency()` in auto-generated `*Config.cmake` file.

## Example

Check [examples](https://github.com/black-desk/PFL.cmake/tree/master/examples)
online.
