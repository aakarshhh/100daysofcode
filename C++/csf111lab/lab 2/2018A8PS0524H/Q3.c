#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main(){
    char ch1;
    scanf("%c",&ch1);

    if(ch1 == 'a' || ch1 == 'e' || ch1 == 'i' || ch1 == 'o' || ch1 == 'u' || ch1 == 'A' || ch1 == 'E' || ch1 == 'I' || ch1 == 'O' || ch1 == 'U'){
        printf("%c is a Vowel",ch1);
    }
    else{
        printf("%c is a Consonant",ch1);
    }
}
