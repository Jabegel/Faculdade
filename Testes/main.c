
#include <stdio.h>
#include <locale.h>

int main() {
    setlocale(LC_ALL,"Portuguese");
int a = 10, b = 3;
int soma = a + b;
int subtracao = a - b;
int multiplicacao = a * b;
float divisao = (float)a / b;
int modulo = a % b;
printf("Soma: %d\n", soma);
printf("Subtra��o: %d\n", subtracao);
printf("Multiplica��o: %d\n", multiplicacao);
printf("Divis�o: %.2f\n", divisao);
printf("M�dulo: %d\n", modulo);
return 0;
}