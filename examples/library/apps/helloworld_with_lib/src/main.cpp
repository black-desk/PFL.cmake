#include <iostream>

#include "helloworld/lib.hpp"

auto main() -> int
{
        std::cout << "version: " << helloworld::get_version() << std::endl;
        std::cout << "hello world" << std::endl;
        return 0;
}
