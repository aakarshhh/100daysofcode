#include<stdio.h>
#include<stdlib.h>
#include<math.h>
void  main()
{
  int n,i,sum;
  int mn,mx;

  printf("Input the  number: ");
  scanf("%d",&n);
    sum = 0;
 printf("\nThe positive divisor: ");
    for (i=1;i<n;i++)
      {
      if(n%i==0)
         {
         sum=sum+i;
         printf("%d ",i);
         }
       }
printf("\nThe sum of the divisor is:%d ",sum);
    if(sum == n)
      printf("So, the number is perfect.");
    else
      printf("\nSo, the number is not perfect.");

}
