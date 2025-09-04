/*
08. Escreva um algoritmo que converta uma temperatura em
Celsius para Fahrenheit, recebendo a temperatura em Celsius como entrada.

(0 °C × 9/5) + 32 = 32 °F

*/

#include <stdio.h>

int main() {
    
    float graus;
    
    printf("Digite a temperatura em Celsius:");
    scanf("%f", &graus);
    
    float fahr = graus * 1.8 + 32;
    
    printf("Convertendo %.2fC para Fahrenheit e %.2fF.", graus, fahr);
    
    return 0;
}