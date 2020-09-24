#include<stdio.h>
#include<stdlib.h>
void main()
 {
    int i,a;
    printf("Input number of terms : ");
    scanf("%d", &a);
    for(i=1;i<=a;i++)
    {
	 printf("Number is : %d and cube of the %d is :%d \n",i,i, (i*i*i));
    }
 }
