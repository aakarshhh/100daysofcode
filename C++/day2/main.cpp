#include <iostream>

using namespace std;

void clkPrt(int n){

     char A[n][n];

for(int i=0 ;i<n;i++){

    for(int j=0;j<n;j++){

   cout << "Enter a Char :\n";
    cin >>  A[i][j];
};

};


    for(int i=0;i<n;i++){
  for(int j=i;j < (n-i) ;j++){

  cout <<  A[i][j] ;
  cout <<  A[j][n-i] ;
  cout <<  A[n-i][n-j] ;
  cout <<  A[n-j][i];


};
cout << "\n" <<endl;

};

}
int main()
{

    int n ;
    cout << "Enter index of grid :" ;
    cin >> n;


     clkPrt(n);

    return 0;
}

