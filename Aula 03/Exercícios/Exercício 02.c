/*
02. Crie um algoritmo que receba dois números e informe qual deles é o maior.
*/

#include <stdio.h>

int main (){

int a, b;

printf("Escreva o Primeiro numero:");
scanf("%d",&a);

printf("Escreva o Segundo numero:");
scanf("%d",&b);

if (a >= b) {
    printf("O Primeiro e Maior que %d", b);
} 

else
{
    printf("\nO Segundo e Maior que %d", a);
}

return 0;
}