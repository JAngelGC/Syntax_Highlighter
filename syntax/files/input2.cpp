#include <iostream>
#include <string>

using namespace std;

// 3. Write a program using recursion that calculates the minimum value of the elements in an array of integers
// input: number of elements followed by the elements
// (one per line)
// output: minumum (only the value)

int minimumValue(int arr[], int ini, int numberElements, int minimum)
{

    // Base case: This happen when we have reached the end of the array
    if (ini >= numberElements)
        return minimum;

    // Recursive condition: If the minimum is less than the element we are checking, we stay with the minimum
    if (minimum < arr[ini + 1])
    {
        ini++;
        return minimumValue(arr, ini, numberElements, minimum);
    }

    // Recursive condition: If the element we are checking is less than the minimum, we switch them
    else
    {
        ini++;
        return minimumValue(arr, ini, numberElements, arr[ini]);
    }
}

int main()
{

    cout << "\n----------------------------------------" << endl;

    int numberOfArray;
    cin >> numberOfArray;

    int arr[numberOfArray];

    for (int i = 0; i < numberOfArray; i++)
        cin >> arr[i];

    cout << "\nEl elemento de menor valor es: " << minimumValue(arr, 0, numberOfArray - 1, arr[0]);

    cout << "\n----------------------------------------" << endl;

    return 0;
}