#include<stdio.h>
int factorial(int n)
{
  if (n == 0) // Base case
    return 1;
  else
    return (n*factorial(n-1));
}

void main()
{
  int n=6, f;


  if (n < 0)
    printf("Factorial of negative integers isn't defined.\n");
  else
  {
    f = factorial(n);
    printf("%d ! = %d\n", n, f);
  }


}
