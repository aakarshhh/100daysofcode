#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main(){
    int x,y;
    scanf("%d %d",&x,&y);

    if(x>=y){
        if(x%y == 0){
            printf("%d is a factor of %d",y,x);
        }else printf("not a factor ");

    }

    if(y>x){
        if(y%x == 0){
            printf("%d is a factor of %d",x,y);
        }else printf("not a factor ");

    }
}
