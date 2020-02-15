import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":
    for line in sys.stdin:
        val = line.split( )[0]
        val2 = line.split( )[1]
        val3 = int(line.split( )[2])
        val4 = "{:03.0f}".format(val3)
        sys.stdout.write("{}\t{}\t{}\t{}\n".format(val,val4,val2,val3))