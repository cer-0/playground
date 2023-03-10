// https://omegaup.com/arena/problem/Xornacci-cpp
#include <iostream>

int xoracci(int a, int b, int n){
    if (n % 3 == 0)
        return a;
    else if (n % 3 == 1)
        return b;
    else if (n % 3 == 2)
        return a ^ b;
    else
        return a;
}

int main() {
    int t, a, b, n;
    std::cin >> t;
    for(int i = 0; i < t; i++) {
        std::cin >> a >> b >> n;
        std::cout << xoracci(a, b, n) << "\n";
    }
    return 0;
}
