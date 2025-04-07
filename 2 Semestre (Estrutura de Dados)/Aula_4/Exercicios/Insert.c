#include <stdio.h>

int main() {
    
    int arr[6] = {31, 41, 59, 26, 41, 58};
    int n = 6;  

    
    for (int i = 1; i < n; i++) {
        int chave = arr[i];
        int j = i - 1;

        
        while (j >= 0 && arr[j] > chave) {
            arr[j + 1] = arr[j];
            j--;
        }

        arr[j + 1] = chave;
    }

    
    printf("Array ordenado: ");
    for (int i = 0; i < n; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");

    return 0;
}
