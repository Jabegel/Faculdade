#include <stdio.h>
int main() {
int soma = 0;
int contador;
// Este loop calcula a soma dos números de 1 a 100
for (contador = 1; contador <= 100; contador++) {
soma += contador;
}
// Exibe o resultado
printf("A soma dos números de 1 a 100 é: %d\n", soma);
return 0;
}