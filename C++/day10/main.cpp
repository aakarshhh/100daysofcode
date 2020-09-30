
#include <iostream>
int x=0;
using namespace std;
int natsum(int n){
    if(n>0) return (n+natsum(n-1));
    else return (0);
}
int Isum(int n)
{
int s=0,i;
for(i=1;i<=n;i++)
s=s+i;
return s;
}
int main()
{
ios::sync_with_stdio(0);
cin.tie(0);


printf("%d\n",natsum(8));
printf("%d",Isum(8));
return 0;
}
