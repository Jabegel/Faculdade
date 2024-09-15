/*
09. Escreva um algoritmo que calcule o Índice de Massa Corporal (IMC) 
de uma pessoa, dado o peso (em kg) e a altura (em metros).

Divide-se o peso do paciente pela sua altura elevada ao quadrado

ICM = P / A^2
*/

#include <stdio.h>

int main() {
    
    float peso, altura;
    
    printf("Digite sua Peso:");
    scanf("%f",&peso);
    
    printf("Digite sua Altura:");
    scanf("%f",&altura);
    
    float alturaquadrada = altura * altura;
    float icm = peso / alturaquadrada;
    
    printf("O seu Peso e %.2f, a sua Altura e %.2f, o seu ICM e de %.2f",peso, altura, icm);
    
    return 0;
}