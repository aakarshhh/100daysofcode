#include<stdio.h>
#include<stdlib.h>
#include <stdio.h>
#include <string.h>

void comp(int n){
  int answer = ~n+1;
  int i = 0;
  int arr[10];
  while(i<10){
    arr[9-i] = answer & 1;
    answer >>= 1;
    i++;
  }
  for(int j = 0; j < 10 ; j++){
    printf("%d",arr[j]);
  }
}

int main(){
  int n;
  scanf("%d",&n);
  printf("The two's complement of %d is : \n",n);
  comp(n);
  return 0;
}
