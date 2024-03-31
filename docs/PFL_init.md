# PFL_init

You should call this function in your top level CMakeLists.txt to
tell PFL.cmake some settings about your project.
Some variables starts with `PFL_` will be set after this function is called.

## Argument

- *boolean* `BUILD_SHARED_LIBS`
  Tell `PFL_add_library()` to default to `SHARED` libraries,
  instead of `STATIC` libraries, when called with no explicit library type;
- *boolean* `ENABLE_INSTALL`
  Whether to enable `install` rules for this project;
- *boolean* `ENABLE_TESTING`
  Whether to call `add_subdirectory` on SUBMODULE/tests/*;
- *boolean* `ENABLE_EXAMPLES`
  Whether to call add_subdirectory on SUBMODULE/examples/*;
- *boolean* `ENABLE_APPLICATIONS`
  Whether to call add_subdirectory on SUBMODULE/apps/*;
- *boolean* `ENABLE_EXTERNALS`
  Whether to call add_subdirectory on /externals/*;
- *list* `EXTERNALS`
  The list of directories in /externals contain dependencies
  which should be embed to this project.
  PFL.cmake will call `add_subdirectory` on them by order
  if `ENABLE_EXTERNALS` is `ON`.

## Example

```cmake
# At the very beginning of your top level CMakeLists.txt.

cmake_minimum_required(VERSION 3.11.4 FATAL_ERROR)

project(xxx LANGUAGES CXX)

if(CMAKE_VERSION VERSION_LESS 3.21)
  # https://www.scivision.dev/cmake-project-is-top-level/
  get_property(not_top DIRECTORY PROPERTY PARENT_DIRECTORY)
  if(NOT not_top)
    set(PROJECT_IS_TOP_LEVEL true)
  endif()
endif()

# Define some default options for your project:

option(xxx_BUILD_SHARED_LIBS "Default to build shared library of XXX" ${PROJECT_IS_TOP_LEVEL})
option(xxx_ENABLE_INSTALL "Enable install target of XXX" ${PROJECT_IS_TOP_LEVEL})
option(xxx_ENABLE_TESTING "Build and running test of XXX" ${PROJECT_IS_TOP_LEVEL})
option(xxx_ENABLE_EXAMPLES "Build examples of XXX" ${PROJECT_IS_TOP_LEVEL})
option(xxx_ENABLE_EXTERNALS "Enable external libraries of XXX" "${PROJECT_IS_TOP_LEVEL}")
option(xxx_ENABLE_APPLICATIONS "Build applications of XXX" ${PROJECT_IS_TOP_LEVEL})

if(${PROJECT_IS_TOP_LEVEL})
  set(xxx_EXTERNALS_DEFAULT "A;B;C")
endif()
option(xxx_EXTERNALS "List of libraries will be embed into XXX" ${XXX_EXTERNALS_DEFAULT})

include(./cmake/PFL.cmake)

PFL_init(
  BUILD_SHARED_LIBS "${xxx_BUILD_SHARED_LIBS}"
  ENABLE_INSTALL "${xxx_ENABLE_INSTALL}"
  ENABLE_TESTING "${xxx_ENABLE_TESTING}"
  ENABLE_EXAMPLES "${xxx_ENABLE_EXAMPLES}"
  ENABLE_EXTERNALS "${xxx_ENABLE_EXTERNALS}"
  ENABLE_APPLICATIONS "${xxx_ENABE_APPLICATIONS}"
  EXTERNALS "${xxx_EXTERNALS}"
)

# or just

PFL_init(AUTO)

```
