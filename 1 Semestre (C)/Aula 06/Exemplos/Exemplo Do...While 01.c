/*
Impressão de números de 1 a 5
*/

#include <stdio.h>
int main() {
int contador = 1;
// Estrutura do loop do...while para repetir até contador > 5
do {
printf("%d ", contador);
contador++;
} while (contador <= 5);
return 0;
}