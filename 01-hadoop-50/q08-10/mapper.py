import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    for line in sys.stdin:
        key = line.split("   ")[0]
        val = float(line.split("   ")[2])

        sys.stdout.write("{}\t1\t{}\n".format(key, val))