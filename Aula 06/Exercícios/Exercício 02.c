/*
Escreva um programa que calcula a soma dos primeiros N números ímpares.
*/

#include <stdio.h>

int main() {
    int N, soma = 0;
    
    printf("Digite o valor de N: ");
    scanf("%d", &N);

    int contador = 0;
    
    int i = 1;

   
    while (contador < N) {
        soma += i;     
        contador++;     
        i += 2;         
    }

    printf("A soma dos primeiros %d numeros impares e: %d\n", N, soma);

    return 0;
}
