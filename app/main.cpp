#include "dummy.h"
#include <git2.h>

#include <iostream>

int main()
{
    dummy test{};
    std::cout << test.doSomething("hello world") << std::endl;
}
