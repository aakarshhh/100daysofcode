
#include <iostream>
#include<math.h>
int nfact(int n){
    if(n>0) return (n*nfact(n-1));
    else return (1);
}
int pow1(int m,int n)
{
if(n==0)
return 1;
if(n%2==0)
return pow1(m*m,n/
2);
return m * pow1(m*m,(n-1)/2);
}
float taylor(int t,int n){
    float c =(float)pow1(t,n)/nfact(n);
    if(n>0) return (c+taylor(t , n-1));
    else return (1);
}

int main()
{

printf("%f\n",taylor(3,12));

return 0;
}
