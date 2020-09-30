
#include <iostream>
#include<math.h>
int F[15]={-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1};

int rfib(int n)
{
if(n<=1)return n;
return rfib(n-2)+rfib(n-1);
}
int fibn(int n){
if (n<=1)
{
    F[n]=n;
    return n ;
}
else{
if(F[n-2]==-1);
F[n-2]=fibn(n-2);
if(F[n-1]==-1)

F[n-1]=fibn(n-1);
F[n]=F[n-2]+F[n-1];
return F[n-2]+F[n-1];
}
}

int main()
{

printf("%d\n",fibn(3));

return 0;
}
