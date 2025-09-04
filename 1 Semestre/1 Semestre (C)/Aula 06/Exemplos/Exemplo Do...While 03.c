/*
Verificação de senha
*/

#include <stdio.h>
#include <string.h>
int main() {
char senhaCorreta[] = "senha123"; // Armazena a senha correta
char senhaDigitada[20]; // Armazena a senha digitada pelo usuário
// Loop que continua até que a senha correta seja digitada
do {
printf("Digite a senha: ");
scanf("%19s", senhaDigitada); // Lê a senha digitada, limitando a 19 caracteres (o último é o terminador)
} while (strcmp(senhaDigitada, senhaCorreta) != 0); // Verifica se as strings são diferentes// Mensagem de sucesso
printf("Acesso permitido!\n");
return 0;
}