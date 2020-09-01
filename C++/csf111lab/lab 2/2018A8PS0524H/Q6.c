#include <stdio.h>
#include <stdlib.h>
int main()
{
    int n;
    scanf("%d",&n);
    if(n>10 ||n < 0) printf("Invalid Grade\n");
    else if(n <3) printf("F\n");
    else if(n ==3 ||n == 4) printf("D\n");
    else if(n ==5 ||n == 6) printf("C\n");
    else if(n ==7 ||n == 8) printf("B\n");
    else if(n ==9 ||n == 10) printf("A\n");
    return 0;
}
