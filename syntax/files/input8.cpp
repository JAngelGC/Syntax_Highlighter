// #include "Shape.h"
// #include "Circle.h"
#include "Shape.cpp"
#include "Circle.cpp"

int main()
{
    Shape figura1(1, 2);

    cout << figura1.draw() << " con valor x en : " << figura1.getValueX() << " y  valor y en : " << figura1.getValueY() << endl;

    Circle circulo1(2, 3, 5);

    cout << circulo1.draw() << " con valor x en : " << circulo1.getValueX() << " y  valor y en : " << circulo1.getValueY() << " con radio de " << circulo1.getValueR() << endl;

    return 0;
}