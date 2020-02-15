import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
    value = 0
    for line in sys.stdin:
        if value < 6:
            val, key, fecha, val = line.split("\t")
            val = int(val)

            sys.stdout.write("{}\t{}\t{}\n".format(key, fecha, val))
            value += 1