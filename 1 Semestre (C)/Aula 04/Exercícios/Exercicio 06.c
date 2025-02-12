/*
06. Escreva um algoritmo que receba um número e mostre o
dobro dele.
*/

#include <stdio.h>

int main()
{
    int n;
    
    printf("Digite o seu numero:");
    scanf("%d",&n);
    
    int dobro = n * n;
    
    printf("O Dobro de %d e %d.", n, dobro);

    return 0;
}