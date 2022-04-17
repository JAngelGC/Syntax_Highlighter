#include <iostream>

using namespace std;


int factorialIterativo(int number){

    int acumulado = 1;
    for(int i=number; i>0; i--){
        acumulado = acumulado * i;
    }

    return acumulado;
}


int factorialRecursivo(int number){

    if(number==1 )
        return 1;

    return number * factorialRecursivo(number-1);
}




int main(){

    cout << "\n-------------------------" << endl;

    int numero = 6;



    cout << "El factorial ITERATIVO de " << numero << " es: " << factorialIterativo(numero) << endl;

    cout << "El factorial RECURSIVO de " << numero << " es: " << factorialRecursivo(numero) << endl;

    

    cout << "\n-------------------------" << endl;

    return 0;
}
