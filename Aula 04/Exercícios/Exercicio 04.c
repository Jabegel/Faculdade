//Escreva um algoritmo que calcule a média ponderada de três notas, onde os pesos são respectivamente 2, 3 e 5.
// MP = n1*p1 + n2*p2 + n3*p3 / p1 + p2 + p3

#include<stdio.h>

int main(){

int n1, n2, n3;
int p1 = 2;
int p2 = 3;
int p3 = 5;

printf("Digite sua primeira nota:");
scanf("%d", &n1);

printf("Digite sua segunda nota:");
scanf("%d", &n2);

printf("Digite sua terceira nota:");
scanf("%d", &n3);

int mp = n1 * p1 + n2 * p2 + n3 * p3;
int div = p1 + p2 + p3;
double resultado = (double) mp / div;

printf("A media ponderada e:%.2f\n", resultado);

return 0;

}