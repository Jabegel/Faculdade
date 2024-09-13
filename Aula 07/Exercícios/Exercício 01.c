/*
que leia 5 números inteiros e armazene-os em um vetor. Em seguida, calcule e imprema a soma dos elementos desse vetor.
*/


#include <stdio.h>

int main()
{
    int numeros[5]; 
    int soma; 
    
    for (int i = 0; i < 5; i++){
        printf("Digite um numero:");
        scanf("%d",&numeros[i]);
        soma += numeros[i];
    }
    
    printf("Soma dos valores do vetor:%d", soma);
    
    return 0;
}