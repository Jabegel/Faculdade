#include <stdio.h>

// Vamos criar um programa que soma dois números inteiros e exibe oresultado.

int main() {

int a,b;


printf("Digite seu primeiro numero:\n");
scanf("%d", &a);
printf("Digite seu segundo numero:\n");
scanf("%d", &b);

int soma = a + b;

printf("A soma dos seus numeros: %d\n", soma);

return 0;

}