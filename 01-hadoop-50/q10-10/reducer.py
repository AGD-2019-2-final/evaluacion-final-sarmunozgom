import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#
from operator import itemgetter
if __name__ == '__main__':

    custom = None
    data = []


    for line in sys.stdin:
        key = line.split("\t")[1]
        val = line.rstrip().split("\t")[2]
        if key == custom:
            data.append(val)
        else:
            if custom is not None:

                sys.stdout.write("{}\t{}\n".format(custom, ','.join(data)))

                data = []
            custom = key
            data.append(val)


    sys.stdout.write("{}\t{}\n".format(custom, ','.join(data)))