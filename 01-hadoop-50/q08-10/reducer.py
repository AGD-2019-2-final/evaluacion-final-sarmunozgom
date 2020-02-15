import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':

    curkey = None
    suma = None
    promedio = None
    total = 0

    for line in sys.stdin:

        key, contador, val = line.split("\t")
        val = float(val)
        contador = int(contador)


        if key == curkey:
            suma += val
            total += contador
            promedio = suma/total
            promedio = float(promedio)
        else:

            if curkey is not None:

                sys.stdout.write("{}\t{}\t{}\n".format(curkey, suma, promedio))

            curkey = key
            suma = val
            promedio = val
            total = contador

    sys.stdout.write("{}\t{}\t{}\n".format(curkey, suma, promedio))