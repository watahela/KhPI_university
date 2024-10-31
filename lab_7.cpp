#include <iostream>
using namespace std;

void findPositiveColumns(double arr[20][20], int rows, int cols);

int main()
{
    int rows = 3;
    int cols = 4;
    
    double arr[20][20] = {
        {-1.5, 2.4, -3.7, 4.1},
        {5.0, -6.3, 7.8, -8.2},
        {-9.9, 10.5, 11.1, -12.7}
    };
    
    findPositiveColumns(arr, rows, cols);
    
    return 0;
}

void findPositiveColumns(double arr[20][20], int rows, int cols)
{
    for(int i = 0; i < rows; i++) {
        cout << "Row " << i + 1 << " positive elements in columns: ";
        bool hasPositive = false;
        
        for(int j = 0; j < cols; j++) {
            if(arr[i][j] > 0) {
                cout << j + 1 << " ";
                hasPositive = true;
            }
        }
        
        if(!hasPositive) {
            cout << "No positive elements";
        }
        cout << endl;
    }
}
