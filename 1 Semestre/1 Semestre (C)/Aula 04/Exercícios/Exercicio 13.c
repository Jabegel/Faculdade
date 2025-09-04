/*
13. • Escreva um algoritmo que converta um valor em dólares para reais,
dado o valor em dólares e a taxa de câmbio.

Taxa de cambio 5.42
*/

#include <stdio.h>

int main (){

float dolar, cambio;
float taxa_cambio = 5.42;


printf("Digite o valor em dolares:");
scanf("%f", &dolar);

cambio = dolar * taxa_cambio;


printf("O valor em dolares e %.2f, fazendo a conversao com a taxa de %.2f recebera em reais %.2f",dolar,taxa_cambio, cambio);

return 0;
}