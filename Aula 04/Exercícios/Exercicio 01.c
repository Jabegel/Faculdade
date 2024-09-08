//Escreva um algoritmo que receba dois números e realize as quatro operações básicas 
//(adição, subtração, multiplicação e divisão), mostrando os resultados.

#include <stdio.h>

int main(){

int num01,num02;

printf("Digite o primeiro numero:\n");
scanf("%d", &num01);

printf("Digite o segundo numero:\n");
scanf("%d", &num02);

int adicicao = num01 + num02;
int subtracao = num01 - num02;
int multiplicacao = num01 * num02;
int divisao = num01 / num02;

printf("O Resultado da soma e %d, da subtracao %d, da multiplicacao %d e da divisao e %d", adicicao, subtracao, multiplicacao, divisao);



return 0;

}