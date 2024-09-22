#include <stdio.h>
int main() {
int contador;
// Este loop verifica e imprime os múltiplos de 5 entre 1 e 50
for (contador = 1; contador <= 50; contador++) {
if (contador % 5 == 0) {
printf("%d ", contador);
}
}
printf("\n"); // Para pular para a próxima linhareturn 0;
}