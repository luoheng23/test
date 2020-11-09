#include <stdio.h>

int main() {
  unsigned char a = 254;
  if ((unsigned char)-1 > a) {
    printf("%d\n", a);
  }
  printf("%d %d\n", a, (unsigned char)-1);
}