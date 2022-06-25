#include <string>

extern "C" int greet(int x, int y);

int main(int argc, char* argv[])
{
    int x = argc >= 2 ? std::stoi(argv[1]) : 3;
    int y = argc >= 3 ? std::stoi(argv[2]) : 0;
    return greet(x, y);
}
