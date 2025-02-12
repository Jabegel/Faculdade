/*
07. Escreva um algoritmo que calcule a raiz quadrada de um
número.
*/

#include <stdio.h>
#include <math.h>

int main() {
    double numero, resultado;

    printf("Digite um número positivo para calcular a raiz quadrada: ");
    scanf("%lf", &numero);

    if (numero < 0) {
        printf("Não é possível calcular a raiz quadrada de um número negativo.\n");
        return 1;
    }

    resultado = sqrt(numero);

    printf("A raiz quadrada de %.2f é %.5f\n", numero, resultado);

    return 0;
}