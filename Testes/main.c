
#include <stdio.h>
#include <locale.h>

int main() {
    setlocale(LC_ALL,"Portuguese");
int a = 10, b = 3;
int soma = a + b;
int subtracao = a - b;
int multiplicacao = a * b;
float divisao = (float)a / b;
int modulo = a % b;
printf("Soma: %d\n", soma);
printf("Subtração: %d\n", subtracao);
printf("Multiplicação: %d\n", multiplicacao);
printf("Divisão: %.2f\n", divisao);
printf("Módulo: %d\n", modulo);
return 0;
}