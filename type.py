
class File:
    def __init__(self, filename):
        self.filename = filename

    def __enter__(self):
        self.fp = open(self.filename)
        return self.fp

    def __exit__(self, exc_type, exc_val, exc_tb):
        print(exc_type)
        print(exc_val)
        print(exc_tb)
        self.fp.close()


with File("test.py") as f:
    raise Exception("trouble")
    for line in f:
        print(line)
