#include <stdio.h>
#include <stdlib.h>

int main()
{
    int n;
    scanf("%d",&n);
    if(n<=0 || n>12) printf("Invalid! \n");
    else if(n<8){
        if(n==2) printf("No. of days are : \n 28 ")  ;
        else if(n%2==1) printf("No. of days are :\n 31 ");
        else  printf("No. of days are : \n 30 ");
    }
    else{
        if(n%2==0) printf("no. of days are :31\n");
        else printf("no. of days are :30\n");
    }
    return 0;
}
