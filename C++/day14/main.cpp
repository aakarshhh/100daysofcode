
#include <iostream>
#include<math.h>

float taylor(int x, int n)
{
static double s;
if(n==0)
return s;
s=1+x*s/n;
return taylor(x,n-1);
}

int main()
{

printf("%f\n",taylor(3,12));

return 0;
}
