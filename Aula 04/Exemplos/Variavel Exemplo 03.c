#include <stdio.h>
#include <locale.h>

int main() {

setlocale(LC_ALL,"Portuguese_Brazil");

int num1, num2, soma;
printf("Digite o primeiro n�mero: ");
scanf("%d", &num1);
printf("Digite o segundo n�mero: ");
scanf("%d", &num2);
soma = num1 + num2;
printf("A soma de %d e %d � %d\n", num1, num2, soma);
return 0;
}