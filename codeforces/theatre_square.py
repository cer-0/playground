# https://codeforces.com/problemset/problem/1/A

def main():
    linea = list(map(int, input().split()))
    largo = linea[0]
    ancho = linea[1]
    piedra = linea[2]

    if (largo - piedra >= 0 and ancho - piedra >= 0):
        if (largo % piedra == 0 and ancho % piedra == 0):
            print(largo // piedra * ancho // piedra)
        elif (largo % piedra == 0 and ancho % piedra != 0):
            print((largo // piedra) * (ancho // piedra)
                  + (largo // piedra))
        elif (largo % piedra != 0 and ancho % piedra == 0):
            print((largo // piedra) * (ancho // piedra)
                  + (ancho // piedra))
        else:
            print((largo // piedra) * (ancho // piedra)
                  + (largo // piedra)
                  + (ancho // piedra)
                  + 1)
    else:
        print(1)

if __name__ == "__main__":
    main()
