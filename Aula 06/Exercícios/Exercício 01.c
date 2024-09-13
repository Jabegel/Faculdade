/*
Escreva um programa em que o usuário informa um número inteiro positivo 
e o programa faz uma contagem regressiva a partir desse número até zero.
*/

#include <stdio.h>
int main() {

int a;

printf("Digite seu numero:");
scanf("%d",&a);

int contador = a;

do {
printf("%d ", contador);
contador--;
} while (0 <= contador);
return 0;
}