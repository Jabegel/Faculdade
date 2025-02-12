//Escreva um algoritmo que calcule a área de um retângulo,
//recebendo como entrada a base e a altura.
// (Base x Altura dividido por 2)

#include <stdio.h>

int main() {

int base,altura;


printf("Digite a Base:\n");
scanf("%d", &base);

printf("Digite a Altura:\n");
scanf("%d", &altura);

int area = base * altura / 2;

printf("A area do triangulo e: %d", area);

return 0;

}