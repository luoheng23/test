#include <stdio.h>

long long a()
{
  long long sum = 0;
  for (long long i = 0; i < 2000000; ++i)
  {
    sum += i;
  }
  return sum;
}

long long b()
{
  long long sum = 0;
  for (long long i = 0; i < 1000000; ++i)
  {
    sum += i;
  }
  return sum;
}

long long c()
{
  long long sum = 0;
  for (long long i = 0; i < 3000000; ++i)
  {
    sum += i;
  }
  return sum;
}

long long main()
{
  long long z = 0;
  for (long long i = 0; i < 1000; ++i)
  {
    z += a();
    z += b();
    z += c();
  }
  printf("%d\n", z);
  return 0;
}