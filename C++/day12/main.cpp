
#include <iostream>
#include<math.h>
int pow1(int m,int n)
{
if(n==0)
return 1;
if(n%2==0)
return pow1(m*m,n/
2);
return m * pow1(m*m,(n-1)/2);
}

int main()
{



printf("%d\n",pow1(2,8));

return 0;
}
