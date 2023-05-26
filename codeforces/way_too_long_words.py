# https://codeforces.com/problemset/problem/71/A

def main():
    n = int(input())
    palabras = []
    for _ in range(n):
        cadena = input()
        longitud = len(cadena)
        if (longitud > 10):
            abreviatura = cadena[0] + str(longitud - 2) + cadena[-1]
            palabras.append(abreviatura)
        else:
            palabras.append(cadena)

    for i in palabras:
        print(i)

if __name__ == "__main__":
    main()
