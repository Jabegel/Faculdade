/*
06. Escreva um programa que leia N números inteiros e 
utilize um loop for para calcular e imprimir a média desses números
*/

#include <stdio.h>

int main() {
    int N;
    int numero;
    int soma = 0;

    printf("Digite a quantidade de números que deseja inserir: ");
    scanf("%d", &N);

    if (N <= 0) {
        printf("Por favor, digite um número inteiro positivo.\n");
        return 1;
    }

    for (int i = 1; i <= N; i++) {
        printf("Digite o %dº número: ", i);
        scanf("%d", &numero);
        soma += numero;
    }

    double media = (double)soma / N;
    printf("A média dos números é: %.2f\n", media);

    return 0;
}