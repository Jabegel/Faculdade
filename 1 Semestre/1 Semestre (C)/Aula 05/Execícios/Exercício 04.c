/*
04. Escreva um programa que leia um número inteiro positivo
e use um loop for para calcular o fatorial desse número.
*/

#include <stdio.h>

int main() {
    int numero;
    int fatorial = 1; 

    
    printf("Digite um número inteiro positivo: ");
    scanf("%d", &numero);


    if (numero < 0) {
        printf("Por favor, digite um número positivo.\n");
    } else {
        
        for (int i = 1; i <= numero; i++) {
            fatorial *= i;
        }

        printf("Fatorial de %d = %d\n", numero, fatorial);
    }

    return 0;
}