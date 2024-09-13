/*
Escreva um programa que utilize um loop for para imprimir todos os números
ímpares de 1 a 50.
*/

#include <stdio.h>
int main() {
int j;

for(j = 1; j <= 50; j += 2) {
printf("%d ", j);
}
printf("\n");
return 0;
}