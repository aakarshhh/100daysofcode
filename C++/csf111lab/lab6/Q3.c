#include<stdio.h>
#include<stdlib.h>
#include<math.h>
int gcd(int a, int b)
{
    if (a == 0)
        return b; else if(b==0)
        return a; else if(a>=b)
    return gcd(b, a%b); else if(b>a)
    return gcd(a, b%a);
}
void main()
{
 int a = 36, b = 6;
    printf("GCD(%d, %d): %d\n", a, b, gcd(a, b));
}
