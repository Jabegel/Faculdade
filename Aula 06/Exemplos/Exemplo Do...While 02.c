/*
Pergunta até resposta válida
*/

#include <stdio.h>
#include <string.h>
int main() {
char resposta[10]; // Definimos um array de caracteres para armazenar a resposta// Estrutura do loop do...while para continuar até a resposta ser "sair"
do {
printf("Você quer continuar? (Digite 'sair' para sair): ");
scanf("%9s", resposta); // Lê uma string de até 9 caracteres
} while (strcmp(resposta, "sair") != 0); // Continua até que a resposta seja "sair"
printf("Programa encerrado.\n");
return 0;
}