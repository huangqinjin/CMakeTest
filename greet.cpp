#ifdef _MSC_VER
#define EXPORT __declspec(dllexport)
#else
#define EXPORT __attribute__((visibility("default")))
#endif 

#include <iostream>

extern "C" EXPORT int greet(int x, int y)
{ 
    std::cout << "Hello, CMake " << x << '.' << y << '!' << std::endl;
    return 0;
}
