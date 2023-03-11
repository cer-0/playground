// https://omegaup.com/arena/problem/caminos
#include <iostream>
#define us unsigned short

int main() {
    us n, m;
    std::cin >> n >> m;
    n++; m++;
    long int cuadricula[n][m];

    for (us j = 0; j < m; j++)
        cuadricula[0][j] = 1;

    for (us i = 0; i < n; i++)
            cuadricula[i][0] = 1;

    for (us i = 0; i < n-1; i++) {
        for (us j = 0; j < m-1; j++)
            cuadricula[i+1][j+1] = cuadricula[i][j+1] + cuadricula[i+1][j];
    }

    std::cout << cuadricula[n-1][m-1] << "\n";

    return 0;
}
