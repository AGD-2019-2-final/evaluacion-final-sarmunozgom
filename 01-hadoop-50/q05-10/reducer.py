import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#

if __name__ == '__main__':

    mes = None
    cantidad = 0

    for line in sys.stdin:

        llave, valor = line.split("\t")
        valor = int(valor)

        if llave == mes:

            cantidad += valor
        else:

            if mes is not None:

                sys.stdout.write("{}   {}\n".format(mes, cantidad))

            mes = llave
            cantidad = valor

    sys.stdout.write("{}   {}\n".format(mes, cantidad))