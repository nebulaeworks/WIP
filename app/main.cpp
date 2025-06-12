#include "dummy.h"
#include <iostream>

int main()
{
    dummy test{};
    std::cout << test.doSomething("hello world") << std::endl;
}
