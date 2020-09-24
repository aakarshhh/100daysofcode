#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main(){
   int n,f;
   scanf("%d",&n);
   int l = n%10;
   while (n>0){
    f =n%10;
    n/=10;
    }
    int sum = f+l;
    printf("%d",sum);
}
