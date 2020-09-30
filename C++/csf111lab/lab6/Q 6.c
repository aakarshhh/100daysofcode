#include<stdio.h>
#include<stdlib.h>
#include <stdio.h>
int power(int b, int p){
    if (p != 0)
        return (b * power(b, p - 1));
    else
        return 1;
}

void main() {
    int b=0, p=0;
    printf("Enter base:");
    scanf("%d", &b);

    printf("Enter power:");
    scanf("%d", &p);

    printf("%d^%d = %d", b, p, power(b, p) );

}
