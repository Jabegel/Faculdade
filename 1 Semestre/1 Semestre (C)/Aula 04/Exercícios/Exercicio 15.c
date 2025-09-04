/*
15. Escreva um algoritmo que calcule o salário líquido de um
funcionário, dados o salário bruto e o desconto do INSS (em
porcentagem).
*/

#include <stdio.h>

int main() {
    
    float salario_bruto, desconto;
    
    printf("Informe seu Salário Bruto:");
    scanf("%f",&salario_bruto);
    
    printf("Informe o Desconto do INSS:");
    scanf("%f",&desconto);
    
    float desconto_porcentagem = salario_bruto * desconto / 100;
    float salario_liquido = salario_bruto - desconto_porcentagem;
    
    printf("Seu Salário Liquido é: R$ %.2f", salario_liquido);
    
    
    return 0;
}