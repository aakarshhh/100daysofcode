
#include <iostream>

using namespace std;

void fun(int n)
{
if(n>0)
{
printf("%d ",n);
fun(n-1);

}
}
int main() {
ios::sync_with_stdio(0);
cin.tie(0);

int x=3;
fun(x);
return 0;
}
