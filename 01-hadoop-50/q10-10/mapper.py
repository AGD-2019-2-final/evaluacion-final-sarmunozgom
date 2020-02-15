import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#

if __name__ == "__main__":

    for line in sys.stdin:
        line = line.rstrip().split('\t')
        for l in line[1].split(','):

            sys.stdout.write("{}\t{}\t{}\n".format(l+line[0].zfill(2),l, line[0]))