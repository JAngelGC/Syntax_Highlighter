#include <iostream>
#include <vector>

using namespace std;

// int arr[] = {4,8,1,7,3,5,6};

int arr[] = {27, 10, 12, 20, 25, 13, 15, 22};

void link(int inicio, int mitad, int fin)
{

    cout << "INICIO: " << inicio << " - FIN:" << fin << endl;
    int i = inicio;
    int j = mitad + 1;
    int k = inicio;
    vector<int> temp;
    // int temp[] = {};

    while (i <= mitad && j <= fin)
    {
        if (arr[i] < arr[j])
        {
            // temp.at(k) = arr[i];
            temp.push_back(arr[i]);
            cout << "El elemento que esta en: " << i << ": " << arr[i] << " ha sido pusheado en el temporal" << endl;
            i++;
        }
        else
        {
            // temp.at(k) = arr[j];
            temp.push_back(arr[j]);
            // cout << "El elemento " << arr[j] << " ha sido pusheado en el temporal" << endl;
            cout << "El elemento que esta en: " << j << ": " << arr[j] << " ha sido pusheado en el temporal" << endl;
            j++;
        }

        k++;
        cout << "K arriba: " << k << endl;
    }

    // cout << "Arreglo temporal: " << endl;
    // for(int q=0; q<temp.size(); q++)
    //     cout << temp.at(q) << " ";
    // cout << endl;

    // cout << k << endl;
    if (i > mitad)
    { // Se acabaron los elementos del arreglo de i
        while (k <= fin)
        {
            // temp.at(k) == arr[j];
            temp.push_back(arr[j]);
            // cout << "El elemento " << arr[j] << " ha sido pusheado en el temporal" << endl;
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
            // temp.at(k) == arr[i];
            temp.push_back(arr[i]);
            // cout << "El elemento " << arr[i] << " ha sido pusheado en el temporal" << endl;
            cout << "El elemento que esta en: " << i << ": " << arr[i] << " ha sido pusheado en el temporal" << endl;

            i++;
            k++;
            cout << "K abajo: " << k << endl;
        }
    }

    // Copiar el array temporal al original
    // cout << "temporal en su primera posi: " << temp.at(0) << endl;
    // cout << "temporal en su segunda posi: " << temp.at(1) << endl;

    // Despues activar esto
    // for(int o=0; o<temp.size(); o++)
    //     cout << temp.at(o) << " - ";

    cout << endl;
    for (auto m : temp)
        cout << m << " - ";

    cout << endl;
    cout << "******************* inicio: " << inicio << "   temp.size():" << temp.size() << "    k:" << k << endl;

    // for(int d=inicio; d<temp.size(); d++){
    //     arr[d] = temp.at(d);
    //     cout << "Elemento" << d << " valor: " << arr[d] << " copiado" << endl;
    // }

    for (auto p : temp)
    {
        arr[inicio] = p;
        cout << "Elemento" << inicio << " valor: " << p << " copiado" << endl;
        inicio++;
    }

    cout << "\n---TODO BIEN------------------------------------------" << endl;

    // for(int r=inicio; r<k; r++)
    //     cout << temp.at(r) << " " ;
    // cout << endl;
}

void mergeSort(int inicio, int fin)
{

    if (inicio < fin)
    {

        int mitad = (inicio + fin) / 2;

        cout << inicio << " / " << mitad << " / " << fin << endl;

        mergeSort(inicio, mitad);

        mergeSort(mitad + 1, fin);

        link(inicio, mitad, fin);
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