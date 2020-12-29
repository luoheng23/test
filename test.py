
# 隐式解包
a, b, c = [1, 2, 3]
print(a, b, c)
# * 显式解包，位置参数
# ** 显式解包，关键字参数
print(*[1, 2, 3], **{"end": "\tend\n"})

# 打印矩阵
mat = [[(i * 5 + j) % 10 for j in range(5)] for i in range(5)]
for i in range(len(mat)):
    print(*mat[i])

# output
1 2 3
1 2 3   end
0 1 2 3 4
5 6 7 8 9
0 1 2 3 4
5 6 7 8 9
0 1 2 3 4
