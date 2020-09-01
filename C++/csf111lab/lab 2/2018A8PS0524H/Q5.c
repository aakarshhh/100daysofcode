#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main(){
    int x,y,ch1;
    printf("Enter 2 num(s) :\n");
    scanf("%d %d",&x,&y);
    printf("Enter for :\n  Addition : 1\n Subtraction : 2\n Multipication : 3\n Division : 4\n Power  : 5\n");
    scanf("%d",&ch1);
    if(ch1 == 2){
        printf("Sum: %d",x+y);
    }

    else if(ch1 == 1){
        printf("Difference: %d",x-y);
    }

    else if(ch1 == 3){
        printf("Product: %d",x*y);
    }

    else if(ch1 == 4){
        printf("Division: %f",(float)x/y);
    }

    else if(ch1 == 5){
        printf("power: %lf",pow(x,y));
    }
    return 0;
}

