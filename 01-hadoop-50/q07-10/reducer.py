import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == '__main__':
    for line in sys.stdin:
        val, val2, val3, val4= line.split("\t")
        sys.stdout.write("{}\t{}\t{}".format(val,val3,val4))