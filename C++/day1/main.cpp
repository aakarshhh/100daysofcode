#include <iostream>
#include<cmath>
using namespace std;
int m(int a , int b) {
    return a*b;
}
int d(int a , int b) {
    return a/b ;
}
int a(int a , int b) {
    return a+b;
}
int s(int a , int b) {
    return a-b;
}
int p(int a , int b) {
    return pow(a,b);
}

int main()
{
    int n1,n2;
    char c;
    cout << "Hello!" << endl;
    cout << "Enter  number 1 :"  << endl ;
    cin >> n1;
    cout << "Enter  number 2 :"  << endl ;
    cin >> n2;
    cout << "Select a character for the req result \n Multiply(m) \n Divide(d) \n Add(a) \n Substract (s) \n Power(p) \n \:";
    cin >> c;

    if(c=='m'){
        cout << "Result :" << m(n1,n2) << endl;
    }

  else  if(c=='d'){
        cout << "Result :" << d(n1,n2) << endl;
    }

   else  if(c=='a'){
        cout << "Result :" << a(n1,n2) << endl;
    }

   else  if(c=='s'){
        cout << "Result :" << s(n1,n2) << endl;
    }

   else if(c=='p'){
        cout << "Result :" << p(n1,n2) << endl;
    }

    return 0;
}
