#include <stdio.h>
int main(int argc, char *argv[])
{
    for (int i = 0; i < 10; i++)
    {
        if (i == 2)
        {
            printf("%p\n", &i);
        }
        printf("%d\n", i + 1);
    }
    return 0;
}