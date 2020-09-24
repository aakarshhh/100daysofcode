#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int check(int N){

    int A = 0;
    while(N>0){
        int crnt = N%10;
        A += crnt*crnt*crnt;

        N/=10;
    }
    return A;
}

int main(){
    int N;
    scanf("%d",&N);

    if(N == check(N))
    printf("This is an Armstrong Number");

    else
    printf("This is not an Armstrong Number");

}
