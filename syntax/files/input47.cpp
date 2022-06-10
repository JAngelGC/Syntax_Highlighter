#include <iostream>

using namespace std;

// O(n^2)
void intercambioSort(int *arr, int n)
{

    for (int i = 0; i < n - 1; i++)
        for (int j = i + 1; j < n; j++)
            if (arr[i] > arr[j])
            {
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
}

int main()
{

    cout << "\n------------------" << endl;
    int arr[] = {4, 0, 70, 3, 9, 2, 5};

    int n = sizeof(arr) / sizeof(arr[0]);

    intercambioSort(arr, n);

    for (int i = 0; i < n; i++)
        cout << arr[i] << " ";

    cout << "\n------------------" << endl;

    return 0;
}