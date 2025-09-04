/*
05. Escreva um algoritmo que receba dois números inteiros e
mostre o resto da divisão do primeiro pelo segundo.
*/

#include <stdio.h>

int main()
{
   int a, b;
   printf("Digite o Primeiro numero:");
   scanf("%d",&a);
   
   printf("Digite o Segundo numero:");
   scanf("%d",&b);
   
   int divisao = a % b;
   
   printf("O resto da divisao do Primeiro pelo Segundo e:%d", divisao);

    return 0;
}