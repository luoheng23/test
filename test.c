#include <stdio.h>
#include <wchar.h>
#include <string.h>
int main()
{
    wchar_t s[100];
    fgetws(s, 100, stdin);
    printf("str: %s\n", s);
    if (s[wcslen(s) - 1] == '\n')
    {
        printf("strange");
    }
    if (s[wcslen(s) - 2] == '\r')
    {
        printf("more strange");
    }
    fgetws(s, 100, stdin);
    if (s[0] == '\n')
    {
        printf("boom");
    }
    return 0;
}