import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#

if __name__ == '__main__':

    letra = None
    maximo = None
    minimo = None

    for line in sys.stdin:

        llave, valor = line.split("\t")

        if llave == letra:
            minimo=min(minimo,valor)
            maximo = max(maximo,valor)
        else:

            if letra is not None:

                sys.stdout.write("{}\t{}\t{}\n".format(letra, maximo, minimo))

            letra = llave
            maximo=valor
            minimo = valor
    sys.stdout.write("{}\t{}\t{}\n".format(letra, maximo,minimo))