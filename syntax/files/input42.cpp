// Jose Angel Gonzalez Carrera
// A01552274
// Martes 18 de mayo de 2021

#include "Envio.cpp"
#include "Paquete.cpp"
#include "Sobre.cpp"

void espaciado()
{
    cout << "\n********************************************\n"
         << endl;
}

int main()
{

    // NOTA IMPORTANTE:
    //  La funcion calculaCosto se llama cuando se imprimen las clases, en la funciÃ³n imprimir se actualiza el valor del costo

    // Compilar
    // g++ main.cpp
    // ./a.out

    espaciado();

    // Clase Envio -------------------------------------------------------------------------
    Envio envio1;
    cout << "Envio sin parametros" << endl;
    envio1.imprimir();

    espaciado();

    Envio envio2("Jose Angel", "Avenida Mariano #916", "Orizaba", "Veracruz", "94745", "98471", 200);
    cout << "Envio con parametros" << endl;
    envio2.imprimir();

    espaciado();

    // Clase Paquete -------------------------------------------------------------------------
    Paquete paquete1;
    cout << "Paquete sin parametros" << endl;
    paquete1.imprimir();

    espaciado();

    Paquete paquete2(20, 25, 10, 4, 40);
    cout << "Paquete con parametros de Paquete, pero sin parametros en Envio" << endl;
    paquete2.imprimir();

    espaciado();

    Paquete paquete3("Albert Gonzalez", "Avenida de la Paz", "Nogales", "Sonora", "92841", "76123", 100, 14, 31, 8, 5, 30);
    cout << "Paquete con parametros de Paquete y con parametros en Envio" << endl;
    paquete3.imprimir();

    espaciado();

    // Clase Sobre -------------------------------------------------------------------------
    Sobre sobre1;
    cout << "Sobre sin parametros" << endl;
    sobre1.imprimir();

    espaciado();

    Sobre sobre2(14, 40, 200);
    cout << "Sobre con parametros de Sobre, pero sin parametros en Envio" << endl;
    sobre2.imprimir();

    espaciado();

    Sobre sobre3("Valeria Gonzalez", "Avenida Hidalgo", "Tehuacana", "Puebla", "73914", "29441", 200, 16, 32, 150);
    cout << "Sobre con parametros de Sobre y con parametros en Envio" << endl;
    sobre3.imprimir();

    espaciado();

    cout << "Demostracion del funcionamiento de calculaCosto en cada clase " << endl;
    cout << "Costo de un envio: " << envio2.calculaCosto() << endl;
    cout << "Costo de un paquete; " << paquete3.calculaCosto() << endl;
    cout << "Costo de un sobre: " << sobre3.calculaCosto() << endl;

    return 0;
}