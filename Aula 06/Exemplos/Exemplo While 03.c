/*
Cálculo do fatorial de um número
*/

#include <stdio.h>
int main() {
int numero, fatorial = 1, contador = 1;
// Solicita ao usuário que digite um número inteiro positivo
printf("Digite um número inteiro positivo: ");
scanf("%d", &numero);
// Calcula o fatorial usando o loop while
while (contador <= numero) {
fatorial *= contador; // fatorial = fatorial * contador
contador++;
}
// Exibe o resultado
printf("O fatorial de %d é %d\n", numero, fatorial);
return 0;
}