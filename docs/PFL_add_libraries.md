# PFL_add_libraries

This function is used to add libraries in the `libs` directory
for a large c++ project constructed with multiple module.

It should only be called in `${PROJECT_SOURCE_DIR}`,
`libs` in submodule root is not allowed.

If `${CMAKE_CURRENT_SOURCE_DIR}/tests/CMakeLists.txt` exists
and testing is enabled in your project,
PFL.cmake will call add_subdirectory to build test of your libraries.

## Argument

- *list* `LIBS`
  List of directories under `libs` that should be considered as submodule roots.
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
- *list* `TESTS`
  Directories in `/tests` that contain source code of tests.
  If test targets is enabled in your project,
  which can be done by set `ENABLE_TESTING` to true when call `PFL_init`,
  PFL.cmake will call add_subdirectory on these directory in order.

## Example

```cmake
# ...

# After PFL_init called in your top level CMakeLists.txt

PFL_add_libraries(LIBRARIES A B C)
```
This make PFL.cmake set `PFL_LIBRARIES` to `A;B;C`
and call add_subdirectory on `${CMAKE_CURRENT_SOURCE_DIR}/libs/A`,
`${CMAKE_CURRENT_SOURCE_DIR}/libs/B` and `${CMAKE_CURRENT_SOURCE_DIR}/libs/C`.

If the install target of your project is enabled,
which can be done by set `ENABLE_INSTALL` to true when call `PFL_init`,
PFL.cmake will configure the cmake config file for your project
then generate version file.

You can override the default cmake config file by providing
`${CMAKE_CURRENT_SOURCE_DIR}/misc/cmake/${PROJECT_NAME}Config.cmake.in`.
