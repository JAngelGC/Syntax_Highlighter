#include <iostream>

using namespace std;

void insertionSort(int arr[], int n)
{

    int i, j, temp;

    // We consider the first element is ordered
    for (i = 1; i < n; i++)
    {
        j = i;
        temp = arr[i]; // This is the insertion we want to make, so we look down

        while (j > 0 && temp < arr[j - 1])
        {
            arr[j] = arr[j - 1];
            j--;
        }

        arr[j] = temp;
    }
}

int main()
{

    cout << "\n------------------" << endl;
    int arr[] = {4, 1, 3, 2, 5};

    int n = sizeof(arr) / sizeof(arr[0]);

    insertionSort(arr, n);

    for (int i = 0; i < n; i++)
        cout << arr[i] << " ";

    cout << "\n------------------" << endl;

    return 0;
}