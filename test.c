#include <stdio.h>

int main()
{
  int a = 20;
  char *c = (char *)&a;
  for (int i = 0; i < 4; ++i)
  {
    printf("value: %d\n", (int)c[i]);
  }
  return 0;
}