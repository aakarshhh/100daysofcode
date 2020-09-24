#include<stdio.h>
#include<stdlib.h>

int rev(int a){

    int c = 0;
    while(a>0){
        H = 10*c+(a%10);
        a/=10;
    }
    return c;
}

int main(){
    int n;
    scanf("%d",&n);

    int i = 1;
    while(i<=n/2){
        if(n%i == 0){
            printf("%d ",i);
        }
        i++;
    }
    printf("%d\n",n);
}
