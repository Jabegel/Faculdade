#include <stdio.h>
#include <locale.h>

int main () {

setlocale(LC_ALL,"Portuguese_Brazil");

int numero, digito;
int soma = 0; // Variavel para armazenar a soma dos cubos dos dígitos

//Solicita ao usúario que insira um números
printf("Digite um número inteiro:");
scanf("%d",&numero);

//Executa o loop para calcular a soma dos cubos dos dígitos
do{
    digito = numero % 10; // Extrai o último digito do número
    soma += digito * digito * digito; // Calcula o cubo do dígito e adiciona à soma
    numero /= 10; // Remove o últimmo dígito do número
} while (numero > 0); // Continua enquanto o número for maior que 10

// Exibe o resultado
printf("A soma dos cubos dos dígitos é: %d\n", soma);

return 0;

}