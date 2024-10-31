#include <iostream>
using namespace std;

void splitArrayByK(int arr[], int size, int K);

int main()
{
    int arr[] = {1, 7, 3, 9, 4, 2, 5, 6, 8, 10};
    int size = sizeof(arr)/sizeof(arr[0]);
    int K = 5;
    
    splitArrayByK(arr, size, K);
    
    return 0;
}

void splitArrayByK(int arr[], int size, int K)
{
    int lessThanK = 0;
    int moreThanK = 0;
    
    for(int i = 0; i < size; i++) {
        if(arr[i] < K) lessThanK++;
        if(arr[i] > K) moreThanK++;
    }
    
    int* lessArray = new int[lessThanK];
    int* moreArray = new int[moreThanK];
    
    int lessIndex = 0;
    int moreIndex = 0;
    
    for(int i = 0; i < size; i++) {
        if(arr[i] < K) {
            lessArray[lessIndex] = arr[i];
            lessIndex++;
        }
        if(arr[i] > K) {
            moreArray[moreIndex] = arr[i];
            moreIndex++;
        }
    }
    
    cout << "Elements less than " << K << ": ";
    for(int i = 0; i < lessThanK; i++) {
        cout << lessArray[i] << " ";
    }
    cout << endl;
    
    cout << "Elements greater than " << K << ": ";
    for(int i = 0; i < moreThanK; i++) {
        cout << moreArray[i] << " ";
    }
    cout << endl;

    delete[] lessArray;
    delete[] moreArray;
}
