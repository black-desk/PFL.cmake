#include <iostream>

#include "MathUtils/Core/add.hpp"

int main()
{
        int a, b;
        std::cin >> a >> b;
        std::cout << MathUtils::Core::add(a, b) << std::endl;
}
