#include <stdio.h>
#include <locale.h>

int main () {

setlocale(LC_ALL,"Portuguese_Brazil");

int numero, digito;
int soma = 0; // Variavel para armazenar a soma dos cubos dos dígitos

//Solicita ao us�ario que insira um n�meros
printf("Digite um n�mero inteiro:");
scanf("%d",&numero);

//Executa o loop para calcular a soma dos cubos dos dígitos
do{
    digito = numero % 10; // Extrai o �ltimo digito do n�mero
    soma += digito * digito * digito; // Calcula o cubo do d�gito e adiciona � soma
    numero /= 10; // Remove o �ltimmo d�gito do n�mero
} while (numero > 0); // Continua enquanto o n�mero for maior que 10

// Exibe o resultado
printf("A soma dos cubos dos d�gitos �: %d\n", soma);

return 0;

}