#include <iostream>

using namespace std;

void bubbleSort(int* arr, int n){

    for(int i=0; i<n-1; i++)

        // Last i elements are already in place 
        for(int j=0; j<n-i-1; j++)

            if(arr[j] > arr[j+1]){
                int temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
            }
}


void bubbleSortOptimized(int* arr, int n){

    // We initialize this variable true to make sure the loop begins
    bool swapped = true;

    for(int i=0; i<n-1 && swapped; i++){

        // We change swapped to understand there hasn't been any changes
        swapped = false;                
        for(int j=0; j<n-i-1; j++)
            if(arr[j] > arr[j+1]){
                int temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
                swapped = true;         // If there is change, it's true
            } 
    }
}



int main(){

    cout << "\n------------------" << endl;
    int arr[] = {4,1,3,2,5};

     int n = sizeof(arr) / sizeof(arr[0]);


    bubbleSortOptimized(arr, n);

    for(int i=0; i<n; i++)
        cout << arr[i] << " " ;

    cout << "\n------------------" << endl;

    return 0;
}