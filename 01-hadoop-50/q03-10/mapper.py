import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":

    for line in sys.stdin:
            clave = line.split(',')[0]
            valor = int(line.split(',')[1])
            sys.stdout.write("{},{},{}\n".format(valor,clave,valor))