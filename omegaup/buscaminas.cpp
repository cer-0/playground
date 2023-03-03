// https://omegaup.com/arena/problem/buscaminas1

#include <iostream>
using namespace std;

int main() {
    int n, m, contador = 0;
    cin >> n >> m;

    int sumas[n+2][m+2], total[n][m];

    for (int i = 0; i < n + 2; i++) {
        for (int j = 0; j < m + 2; j++)
            sumas[i][j] = 0; // Inicializar en 0
    }
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++)
            total[i][j] = 0;
    }

    for (int i = 1; i < n + 1; i++) {
        for (int j = 1; j < m + 1; j++)
            cin >> sumas[i][j]; // Leer datos
    }

    for (int i = 1; i < n + 1; i++) {
        for (int j = 1; j < m + 1; j++) {
            for (int o = -1; o < 2; o++) {
                for (int k = -1; k < 2; k++) {
                    if (sumas[i+o][j+k] == 1)
                        contador++;
                }
            }
            total[i-1][j-1] = contador;
            contador = 0;
        }
    }

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < m; j++)
            cout << total[i][j] << " ";
        cout << "\n";
    }
    return 0;
}
