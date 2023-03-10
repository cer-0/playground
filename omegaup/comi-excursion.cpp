// https://omegaup.com/arena/problem/COMI-Excursion
#include <iostream>

int main() {
    unsigned short n; // camiones
    unsigned long p, c; // preguntas, camión
    std::cin >> n >> p;
    unsigned int camiones[n];
    for (int i = 0; i < n; i++) {
        std::cin >> camiones[i];
    }
    for (unsigned long j = 0; j < p; j++) {
        std::cin >> c;
        std::cout << camiones[c-1] << "\n";
    }
    return 0;
}
