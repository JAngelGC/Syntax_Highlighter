#include <iostream>
#include <vector>

using namespace std;

// int arr[] = {4,8,1,7,3,5,6};

int arr[] = {27, 10, 12, 20, 25, 13, 15, 22};

void merge(int inicio, int mitad, int fin)
{

    cout << "**** Comienzo funcion merge ***" << endl;
    cout << "INICIO: " << inicio << " - FIN:" << fin << endl;
    int i = inicio;
    int j = mitad + 1;
    int k = inicio;
    vector<int> temp;

    while (i <= mitad && j <= fin)
    {
        if (arr[i] < arr[j])
        {
            temp.push_back(arr[i]);
            cout << "El elemento que esta en: " << i << ": " << arr[i] << " ha sido pusheado en el temporal" << endl;
            i++;
        }
        else
        {
            temp.push_back(arr[j]);
            cout << "El elemento que esta en: " << j << ": " << arr[j] << " ha sido pusheado en el temporal" << endl;
            j++;
        }
        k++;
        cout << "K arriba: " << k << endl;
    }

    if (i > mitad)
    { // Se acabaron los elementos del arreglo de i
        cout << "\nSe acabo el array de i, ahora se pushea todo el arreglo de j al temporal" << endl;
        while (k <= fin)
        {
            temp.push_back(arr[j]);
            cout << "El elemento que esta en: " << j << ": " << arr[j] << " ha sido pusheado en el temporal" << endl;
            k++;
            j++;
            cout << "K abajo: " << k << endl;
        }
    }
    else
    { // Se acabaron los elementos del arreglo j
        while (k <= fin)
        {
            cout << "\nSe acabo el array de j, ahora se pushea todo el arreglo de i al temporal" << endl;
            temp.push_back(arr[i]);
            cout << "El elemento que esta en: " << i << ": " << arr[i] << " ha sido pusheado en el temporal" << endl;
            k++;
            i++;
            cout << "K abajo: " << k << endl;
        }
    }

    cout << "\nMostrando el arreglo temporal: " << endl;
    for (auto element : temp)
        cout << element << " - ";

    cout << endl;
    // cout << "******************* inicio: " << inicio << "   temp.size():" << temp.size() << "    k:" << k << endl;

    // Copiando los elementos del temporal al original
    cout << "\nCopiando arreglo temporal al original " << endl;
    for (auto element : temp)
    {
        arr[inicio] = element;
        cout << "Elemento" << inicio << " valor: " << element << " copiado" << endl;
        inicio++;
    }

    cout << "\n--- TODO BIEN - CIERRE FUNCION ------------------------------------------\n"
         << endl;
}

void mergeSort(int inicio, int fin)
{

    if (inicio < fin)
    {

        int mitad = (inicio + fin) / 2;

        cout << inicio << " / " << mitad << " / " << fin << endl;

        mergeSort(inicio, mitad);

        mergeSort(mitad + 1, fin);

        merge(inicio, mitad, fin);
    }
}

int main()
{

    cout << "\n------------------" << endl;

    int n = sizeof(arr) / sizeof(arr[0]);

    mergeSort(0, n - 1);

    for (int i = 0; i < n; i++)
        cout << arr[i] << " ";

    cout << "\n------------------" << endl;

    return 0;
}