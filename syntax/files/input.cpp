// Your First C++ Program


#include <iostream>
#include <string>

using namespace std;
void calcular(int x, int y) {
  float a = x + y;
}

int main() {
    string str1 = "Hello World!";
    string str2 = "hola mundo";

    int i = 0, count = 0;
    int x = 2 + 1;
    int y = 40 * 5;
    int bin = 0b11000;
    int hex = 0xf;
    int octal = 017;

    char prueba = 'A';

    float num = 3.1;
    string result = (x < 18) ? "Good day." : "Good evening.";

    /*Holapr
    \~\!\@\#\+\$\\\-\(\)\{\}
    int i = 0, count = 0;
    int x = 2 + 1;
    int y = 40 * 5;
    obando*/


    calcular(x,y);

    do {
      cout << i << "\n";
      i++;
    }
    while (i < 5);

    for (size_t i = 0; i < count; i++) {
      /* code */
    }
    return 0;
}
