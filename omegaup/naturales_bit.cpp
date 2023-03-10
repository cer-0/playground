// https://omegaup.com/arena/problem/Naturales-Byte
#include <iostream>

int main() {
    unsigned short int x;
    std::cin >> x;
    for (int i = 7; i >= 0; i--)
        std::cout << !!(x&(1ull << i));
    return 0;
}
