
#include <iostream>
int x=0;
using namespace std;
int funA(int n){
    if(n>100) return (n-10);
    else return (funA(funA(n+11)));
}
int main()
{
ios::sync_with_stdio(0);
cin.tie(0);

int r=funA(80);
printf("%d",r);
return 0;
}
