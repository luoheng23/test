
x = [1, 0, 1, 0]
binStr = "".join(str(i) for i in x)
print(int(binStr, 2))

print(sum(v*2**i for i, v in enumerate(reversed(x))))
