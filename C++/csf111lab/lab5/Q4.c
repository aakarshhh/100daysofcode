#include<stdio.h>
#include<stdlib.h>
void main()

{
   int i,j,s,r,k,a=1;
   printf("Input number of rows : ");
   scanf("%d",&r);
   s=r+4-1;
   for(i=1;i<=r;i++)
   {
         for(k=s;k>=1;k--)
            {
              printf(" ");
            }
	   for(j=1;j<=i;j++)
	   printf("%d ",a++);
	printf("\n");
    s--;
   }
}
