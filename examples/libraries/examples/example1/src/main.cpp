#include <iostream>

#include "MathUtils/Core/add.hpp"
#include "MathUtils/Internal/test.hpp"

int main()
{
        int a, b;
        std::cin >> a >> b;
        std::cout << MathUtils::Core::add(MathUtils::Core::add(a, b),
                                          MathUtils::Internal::test())
                  << std::endl;
}
