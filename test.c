#include <stdio.h>

int array[] = {23, 34, 12, 17, 204, 99, 16};
#define TOTAL_ELEMENTS (sizeof(array) / sizeof(array[0]))

int main()
{
    int d = -1, x;
    if (d <= TOTAL_ELEMENTS - 2)
        x = array[d + 1];
    printf("x: %d\n", x);
    int *q = &x;
    int N = 3;
    int p = N * sizeof *q;
    printf("p: %d\n", p);
    int apple = sizeof(int) * p;
    printf("apple: %d\n", apple);
    return 0;
}