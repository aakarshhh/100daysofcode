#include<stdio.h>
#include<stdlib.h>
#include<math.h>
int reverse(int n)
{
    int rn = 0;
    while(n > 0)
    {
        rn = rn*10 + n%10;
        n = n/10;
    }
    return rn;
}


void main()
{
    int num = 4562;
    printf("Reverse of no. is %d", reverse(num));
}
