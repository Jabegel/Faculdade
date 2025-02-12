/*
 Escreva um programa que leia um número inteiro positivo N e use um loop for para calcular a soma de todos os números de 1 a N. 
*/
#include <stdio.h>
int main() {
int a;

printf("Digite um numero:");
scanf("%d",&a);

int soma = 0;
int contador;
for (contador = 1; contador <= a; contador++) {
soma += contador;
}

printf("A soma dos numeros de 1 a %d e: %d\n", a,soma);
return 0;
}