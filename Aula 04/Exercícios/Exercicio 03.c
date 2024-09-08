//Escreva um algoritmo que calcule o volume de uma esfera,
//recebendo como entrada o raio.
//Ve = 4. p.r³/ 3

#include <stdio.h>

int main(){

int raiob;
float pi = 3.14;

printf("Digite o raio:\n");
scanf("%d", &raiob);

int raio = raiob * raiob * raiob;
double volume = 4 * pi * raio / 3;

printf("O Volume e de: %lf", volume);

return 0;

}