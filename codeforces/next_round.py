def main():
    linea = list(map(int, input().split()))
    resultados = list(map(int, input().split()))
    puntaje_min = linea[0]
    lugares_disp = linea[1]
    total = 0
    numeros = []

    # Iterar la lista de elementos
    #   Verificar el puntaje menor
    #   Si hay elementos con puntaje mayor a menor
    #     Agregar a lista y reducir lugares
    #   Continuar hasta que no haya lugares
    #   Cuando lugares estén llenos
    #     verificar si el siguiente elemento es el mismo que el último
    #         si se cumple agregar a la lista
    #   Devolver longitud del arreglo/conteo de variable

    for i in resultados:
        if lugares_disp > 0 and i >= puntaje_min:
            print(f"Cumple    {i}")
            total += 1
            numeros.append(i)
            lugares_disp -= 1

    print(resultados, len(resultados))
    print(numeros, len(numeros))
    i = len(numeros)

    if i != len(resultados):
        while resultados[i] == resultados[i+1]:
            print(f"Cumple    {resultados[i]}")
            numeros.append(resultados[i+1])
            total += 1
            i += 1
        total += 1

    print(total)

if __name__ == "__main__":
    main()
