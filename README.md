# PFL.cmake

This project is design to build c++ project follows [the Pitchfork layout].

You can just copy the [PFL.cmake] file into your awesome project,
then use like this:

```cmake
cmake_minimum_required(VERSION 3.11.4 FATAL_ERROR)

project (
  MyAwesomeProject
  VERSION      0.1.0
  HOMEPAGE_URL https://github.com/<your-username>/MyAwesomeProject
  LANGUAGES    CXX
               C
)

```

For futher information, check [examples] and [documents].

[PFL.cmake]: https://github.com/black-desk/PFL.cmake/releases/latest/download/PFL.cmake

[the Pitchfork layout]: https://github.com/vector-of-bool/pitchfork/blob/develop/data/spec.bs

[examples]: https://github.com/black-desk/PFL.cmake/tree/master/examples

[documents]: https://github.com/black-desk/PFL.cmake/tree/master/docs
