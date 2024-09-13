/*
Perguntando repetidamente ao usuário até que ele digite "sim" ou "não"
*/

#include <stdio.h>
#include <string.h>
int main() {
char resposta[5] = {"sim"}; // Definimos um array de caracteres para armazenar a resposta (sim ou não)
printf("Você respondeu: %s\n", resposta);
while (strcmp(resposta, "não") != 0){
printf("Você quer continuar? (sim/não): ");
scanf("%4s", resposta); // Lê uma string de até 3 caracteres (sim/não)
printf("Você respondeu: %s\n", resposta);}
return 0;
}