/*
11. Escreva um algoritmo que calcule a área de um quadrado,
dado o comprimento do lado.
*/

#include <stdio.h>
#include <math.h>

int main() {
    
    float lado;
    
    printf("Digite o comprimento do Lado:");
    scanf("%f",&lado);
    
    float area = lado * lado;
    
    printf("A Area e de: %.2f", area);
    
    return 0;
}