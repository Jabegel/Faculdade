/*
05. Escreva um programa que utilize um loop for para 
imprimir os números de 10 a 1 em ordem decrescente.
*/

#include <stdio.h>

int main() {
    int numero = 10;

   for ( numero = 10; numero >= 1; numero--) {
       printf("%d ",numero);
   }

    return 0;
}