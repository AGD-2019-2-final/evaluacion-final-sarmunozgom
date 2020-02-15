import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__ == "__main__":

    for line in sys.stdin:
        custom = line.split("   ")[0]
        value =int(line.split("   ")[2])
        date = line.split("   ")[1]

        sys.stdout.write("{}\t{}\t{}\t{}\n".format(str(value/100), custom, date, value))