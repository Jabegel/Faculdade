#include <stdio.h>

int main() {
    
    int arr[5] = {29, 10, 14, 37, 13};
    int n = 5;  

    
    for (int i = 0; i < n - 1; i++) {
        int min_idx = i;

        
        for (int j = i + 1; j < n; j++) {
            if (arr[j] < arr[min_idx]) {
                min_idx = j;
            }
        }

        
        int temp = arr[min_idx];
        arr[min_idx] = arr[i];
        arr[i] = temp;
    }

    
    printf("Array ordenado: ");
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}
