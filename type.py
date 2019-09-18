def main():
    rows = int(input("What is the upper bound of multiplication table? "))
    print("The multiplication table for 2 to", rows)
    print()
    counter = 0
    multiplicationTable(rows,counter)
   
def multiplicationTable(rows,counter):
    size = rows + 1
    # header
    print("X", *range(1, size), sep='\t')
    for i in range(1,size):
        print(i, *(i*nums for nums in range(1, size)), sep='\t')
main()