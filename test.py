
def readCol(filename):
    with open(filename) as f:
        return [line.strip().split()[-1] for line in f]