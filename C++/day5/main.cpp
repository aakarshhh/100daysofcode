
#include <iostream>

using namespace std;

int fun(int n)
{
static int x=0;
if(n>0)
{
x++;
return fun(n-1)+x;
}
return 0;
}
int main() {
ios::sync_with_stdio(0);
cin.tie(0);
int r;
r=fun(5);
printf("%d\n",r);
r=fun(5);
printf("%d\n",r);
return 0;
}
