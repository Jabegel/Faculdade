/*
12. Escreva um algoritmo que calcule a diferença de idades entre duas pessoas, 
dadas suas idades.
*/

#include <stdio.h>

int main() {
    
    int idade01, idade02;
    
    printf("Digite a Idade do Mais Velho:");
    scanf("%d", &idade01);
    
    printf("Digite a Idade do Mais Novo:");
    scanf("%d", &idade02);
    
    int diferenca = idade01 - idade02;
    
    printf("A diferena do Mais velho para o mais Novo e de %d anos.", diferenca);
    
    return 0;
}