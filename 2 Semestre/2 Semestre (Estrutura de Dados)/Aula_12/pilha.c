#include <stdio.h>

int main() {
    int stack[5]; 
    int top = -1; 

    if (top < 4) {
        top++;
        stack[top] = 20;
        printf("Inserido: 20\n");
    }

    if (top < 4) {
        top++;
        stack[top] = 30;
        printf("Inserido: 30\n");
    }

    if (top < 4) {
        top++;
        stack[top] = 10;
        printf("Inserido: 10\n");
    }

    printf("Pilha: ");
    for (int i = top; i >= 0; i--) {
        printf("%d ", stack[i]);
    }
    printf("\n");

    if (top >= 0) {
        printf("Removido: %d\n", stack[top]);
        top--;
    }

    printf("Pilha: ");
    for (int i = top; i >= 0; i--) {
        printf("%d ", stack[i]);
    }
    printf("\n");

    return 0;
}
