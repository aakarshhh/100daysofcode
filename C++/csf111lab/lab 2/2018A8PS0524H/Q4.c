#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main(){
    int y;
    scanf("%d",&y);

    if(y%4 == 0){
        if(y%100 == 0){
            if(y%400 == 0){
                printf("%d is a leap year",y);
            }
            else{
                printf("%d is NOT a leap year",y);
            }
        }
        else{
            printf("%d is a leap year",y);
        }
    }
    else{
        printf("%d is NOT a leap year",y);
    }
}
