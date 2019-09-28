#include <stdio.h>
#include <stdlib.h>
#include <wchar.h>
#include <string.h>
int main()
{
    wchar_t *s = (wchar_t *)(malloc(100));
    printf("length: %d\n", (int)fgetws(s, 100, stdin));
    printf("str: %s\n", s);
    if (s[wcslen(s) - 1] == '\n')
    {
        printf("strange\n");
    }
    printf("%d %c %c\n", wcslen(s), s[wcslen(s) - 1], s[wcslen(s) - 2]);
    if (s[wcslen(s) - 2] == '\r')
    {
        printf("more strange\n");
    }
    fgetws(s, 100, stdin);
    if (s[0] == '\n')
    {
        printf("boom");
    }
    return 0;
}