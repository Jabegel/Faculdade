//VETORES

#include <stdio.h>

int main()
{
    int numeros [5]; // Declaração de um vetor de inteiros com 5 elementos
       // Leitura dos valores do vetor usando scanf
    for (int i = 0; i < 5; i++){
        printf("Digite um numero:");
        scanf("%d",&numeros[i]);
    }
    // Exibindo os valores do vetor
    printf("Valores do vetor:");
    for(int i = 0; i < 5; i++){
        printf("%d ", numeros[i]);
    }
    return 0;
}