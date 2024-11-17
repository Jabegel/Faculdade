/*
07. Escreva um programa que utilize um loop for para contar
e imprimir quantos números entre 1 e 100 são divisíveis por 3.
*/

#include <stdio.h>

int main() {
    int contador = 0;

    printf("Números entre 1 e 100 que são divisíveis por 3:\n");

    for (int i = 1; i <= 100; i++) {
        if (i % 3 == 0) {
            printf("%d ", i); 
            contador++;       
        }
    }

    printf("\nQuantidade total: %d\n", contador);

    return 0;
}