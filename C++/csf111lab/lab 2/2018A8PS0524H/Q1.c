#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main(){
    double x,y,z;
    scanf("%f %f %f",&x,&y,&z);

    double ar;
    double s = (x+y+z)/2;
    if(x+y>z && z+y>x && x+z>y){
        double r = s*(s-x)*(s-y)*(s-z);
        ar = sqrt(r);
        printf("%f\n",ar);
    }
    else{
        printf("Triangle not Possible");
    }

}
