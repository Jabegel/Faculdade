
#include <stdio.h>
#include "arq.h"

int main()
{   
        
        float resultado = 0;
        char op;
       
            float num_1, num_2;
           
            printf("Digite o 1º numero: ");
        scanf("%f", &num_1);
       
        printf("Digite o 2º numero: ");
        scanf("%f", &num_2);
       
        printf("Digite sua operacao (+,-,*,/): ");
        scanf(" %c", &op);
       
        switch (op) {
            case '+':
                resultado = soma(num_1, num_2);
                break;
            case '-':
                resultado = menos(num_1, num_2);
                break;
            case '*':
                resultado = mult(num_1, num_2);
                break;
            case '/':
                resultado = divisao(num_1, num_2);
                break;
            default:
                printf("Operacao invalida!\n");
                return 1;
        }
       
        printf("Resultado: %.2f\n", resultado);
        
        return 0;
}