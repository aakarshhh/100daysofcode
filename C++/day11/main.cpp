
#include <iostream>
int x=0;
using namespace std;
int nfact(int n){
    if(n>0) return (n*nfact(n-1));
    else return (1);
}

int main()
{
ios::sync_with_stdio(0);
cin.tie(0);


printf("%d\n",nfact(5));

return 0;
}
