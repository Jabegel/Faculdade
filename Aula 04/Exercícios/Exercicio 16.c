/*
16. Escreva um algoritmo que calcule o valor do imposto de renda a ser pago, 
dado o salário bruto de um indivíduo. Considere as seguintes faixas de tributação:
* Até R$ 2000,00: Isento
* De R$ 2000,01 até R$ 3000,00: 10% de imposto
* De R$ 3000,01 até R$ 5000,00: 15% de imposto
* Acima de R$ 5000,00: 20% de imposto
*/

#include <stdio.h>

int main() {
    float salario_bruto;
    
    printf("Informe seu Salário Bruto: ");
    scanf("%f", &salario_bruto);
    
    if (salario_bruto <= 2000) {
        printf("Isento de Imposto de Renda\n");
    } else if (salario_bruto >= 2001 && salario_bruto <= 3000) {
        float imposto01 = salario_bruto / 100;
        printf("10%% Imposto que dá %.2f\n",imposto01 * 10);
    } else if (salario_bruto >= 3001 && salario_bruto <= 4000) {
        float imposto02 = salario_bruto / 100;
        printf("15%% Imposto que dá %.2f\n",imposto02 * 15);
    } else {
        float imposto03 = salario_bruto / 100;
        printf("20%% Imposto que dá %.2f\n",imposto03 * 20);
    }

    return 0;
}