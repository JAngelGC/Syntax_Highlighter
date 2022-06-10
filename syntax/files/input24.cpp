// Programa que trabaja con un hash table que maneja
// las colisiones con el mÃ©todo de DirecciÃ³n Abierta de la prueba lineal

// Carlos Daniel Diaz Arrazate - A01734902
// Jose Angel Gonzalez Carrera - A01552274
// Carlos Eduardo Ruiz Lira    - A01735706
// 26/11/21

#include <iostream>
#include <utility>
#include <string>
using namespace std;

class Auto
{

private:
    string m_placa; // es la key
    string m_marca;
    string m_modelo;
    int m_anio;

public:
    Auto()
    {
        m_placa = "No placa";
        m_marca = "No marca";
        m_modelo = "No modelo";
        m_anio = 0;
    };

    Auto(string placa, string marca, string modelo, int anio)
    {
        m_placa = placa;
        m_marca = marca;
        m_modelo = modelo;
        m_anio = anio;
    }

    string getPlaca()
    {
        return m_placa;
    }

    string getAuto()
    {
        return m_placa + " " + m_marca + " " + m_modelo + " " + to_string(m_anio);
    }

    void setAuto(string placa, string marca, string modelo, int anio)
    {
        m_placa = placa;
        m_marca = marca;
        m_modelo = modelo;
        m_anio = anio;
    }
};

class HashTable
{

private:
    int size = 97;
    pair<Auto, char> hashT[97];

    // flags para el char:
    // o = ocupado
    // v= vacÃ­o
    // b= borrado

public:
    HashTable()
    {
        for (int i = 0; i < size; i++)
            hashT[i] = make_pair(Auto(), 'v');
    };

    // Descripcion: Funcion hash que genera un hashcode
    // Entrada: llave (placa)
    // Salida: hashCode
    // Complejidad: O(N)
    int hashCode(string placa)
    {

        int counter = 0;

        for (char c : placa)
            counter += c;

        int mod = counter % size;
        return mod;
    }

    // NOTA: next position = (i+1)%N, where N=numberElements

    // Descripcion: Buscar un elemento de acuerdo a su llave (placa)
    // Entrada: llave del elemento (placa)
    // Salida: string del objeto encontrado o no
    // Complejidad: O(N)
    string search(string placa)
    {

        // Guardar el indice
        int hashC = hashCode(placa);

        // HashC vacio
        if (hashT[hashC].second == 'v')
        {
            return "dato no encontrado";
        }

        // HashC ocupada
        else
        {

            // Resulta que el hashC tiene la misma placa que la llave
            if (placa == hashT[hashC].first.getPlaca())
            {
                return hashT[hashC].first.getAuto();
            }

            // El hashC no tiene la misma placa que la llave
            else
            {
                // se debe recorrer todo hasta encontrar la placa,
                // encontrar una casilla vacia, o haber recorrido todo el arreglo
                int temp = (hashC + 1) % size;
                while (hashT[temp].second != 'v' && temp != hashC)
                {

                    // Se encuentra la placa al recorrer a la derecha
                    if (placa == hashT[temp].first.getPlaca())
                        return hashT[temp].first.getAuto();

                    temp = (temp + 1) % size;
                }
                return "dato no encontrado";
            }
        }
        return 0;
    }

    // Descripcion: Insertar un dato en la estructura de
    // Entrada: El objeto a insertar que tiene su llave (placa)
    // Salida: Nada
    // Complejidad: O(N)
    void ins(Auto car)
    {
        // Guardar el indice
        int hashC = hashCode(car.getPlaca());

        // Si la casilla del hashC esta vacia o borrada, inserta el valor
        if (hashT[hashC].second == 'v')
        {
            hashT[hashC] = make_pair(car, 'o');
            return;
        }

        // Si la casilla del hashC esta ocupada, se debe recorrer el hashT
        else
        {
            int temp = (hashC + 1) % size;
            int firstEmpty;
            bool foundFirstEmpty = false;
            while (hashT[temp].second != 'v')
            {
                if (temp != hashC)
                {

                    // HashC = o, primera posicion = o
                    if (!foundFirstEmpty && hashT[temp - 1].second == 'b')
                    {
                        firstEmpty = temp - 1;
                        foundFirstEmpty = true;
                    }

                    // Guardando la primer casilla borrada
                    // en caso de que no se repita el valor, se insertara en esta posicion
                    if (!foundFirstEmpty && hashT[temp].second == 'b')
                    {
                        firstEmpty = temp;
                        foundFirstEmpty = true;
                    }

                    // Valor duplicado
                    if (hashT[temp].first.getPlaca() == car.getPlaca() && hashT[temp].second == 'o')
                    {
                        cout << "imposible insertar, placa duplicada\n"
                             << endl;
                        return;
                    }
                }

                else if (temp == hashC && !foundFirstEmpty)
                {
                    cout << "Tabla llena, imposible insertar\n"
                         << endl;
                    return;
                }

                temp = (temp + 1) % size;
            }

            if (foundFirstEmpty)
            {
                hashT[firstEmpty] = make_pair(car, 'o');
                return;
            }

            if (hashT[temp].second == 'v')
            {
                hashT[temp] = make_pair(car, 'o');
                return;
            }
        }
    }

    // Descripcion: Eliminar un dato en la estructura
    // Entrada: llave del elemento (placa)
    // Salida: Nada
    // Complejidad: O(N)
    void del(string placa)
    {

        // Guardar el indice
        int hashC = hashCode(placa);

        // Cuando la casilla a eliminar coincide con su hashC y esta ocupada
        if (hashT[hashC].second == 'o' && hashT[hashC].first.getPlaca() == placa)
        {
            hashT[hashC].second = 'b';
            return;
        }

        // Cuando se debe recorrer a la derecha
        else
        {
            int temp = (hashC + 1) % size;
            while (hashT[temp].second != 'v' && temp != hashC)
            {

                if (hashT[temp].second == 'o' && hashT[temp].first.getPlaca() == placa)
                {
                    hashT[temp].second = 'b';
                    return;
                }

                // next position = (i+1)%N
                temp = (temp + 1) % size;
            }
            cout << "Elemento no encontrado" << endl;
        }
    }

    // Descripcion: ImpresiÃ³n de los datos contenidos en la tabla
    // Entrada: Nada
    // Salida: Nada
    // Complejidad: O(N)
    void print()
    {

        // NOTA, IMPORTANTE VERIFICAR LA FLAG DEL ELEMENTO PAIR
        for (int i = 0; i < size; i++)
        {
            cout << i << " ";
            if (hashT[i].second == 'o')
            {
                cout << hashT[i].first.getAuto();
            }
            cout << endl;
        }
    }
};

int main()
{

    HashTable myHashTable;

    int input = 10;
    string placa, marca, modelo;
    int anio;
    Auto miAuto;

    while (input != 0)
    {

        cin >> input;

        switch (input)
        {
        case 1:
        {
            cin >> placa >> marca >> modelo >> anio;
            miAuto.setAuto(placa, marca, modelo, anio);
            myHashTable.ins(miAuto);
            break;
        }
        case 2:
        {
            cin >> placa;
            myHashTable.del(placa);
            break;
        }
        case 3:
        {
            myHashTable.print();
            cout << endl;
            break;
        }
        case 4:
        {
            cin >> placa;
            cout << myHashTable.search(placa) << endl;
            cout << endl;
            break;
        }
        default:
            break;
        }
    }

    return 0;
}
