#include "MathUtils/Core/add.hpp"

#include <iostream>

#include "helloworld/lib.hpp"
namespace MathUtils::Core
{

int add(int a, int b)
{
        std::cout << helloworld::get_version();
        return a + b;
}

}
