#include <stdio.h>

int main()
{
  printf("EOF %d\n", EOF);
  int a = 20;
  printf("??!\n");
  char *c = (char *)&a;
  char *message;
  message = "Hello world";
  printf("%s\n", message);
  for (int i = 0; i < 4; ++i)
  {
    printf("value: %d\n", (int)c[i]);
  }
  return 0;
}