#include "helloworld/lib.hpp"

#include "helloworld/configure.hpp"

namespace helloworld
{
auto get_version() -> const char *
{
        return version;
}
}
