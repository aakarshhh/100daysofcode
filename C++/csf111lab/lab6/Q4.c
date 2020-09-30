#include<stdio.h>
#include<stdlib.h>
int fib(int n)
{
   if (n <= 1)
      return n;
   return (fib(n-1) + fib(n-2));
}

void main ()
{
  int n = 3;
  printf("%d", fib(n));

}
