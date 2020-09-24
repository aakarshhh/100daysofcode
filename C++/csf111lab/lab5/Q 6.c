#include<stdio.h>
#include<stdlib.h>

void main()
{   int n,i,a=9;
	int sum =0;
	printf("Input the number or terms :");
	scanf("%ld",&n);
	for (i=1;i<=n;i++)
	{ sum += a;
	  printf("%d ",a);
	  a=a*10+9;
	}
	printf("The sum of the series = %d \n",sum);
}
