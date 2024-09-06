#include <stdio.h>
#include <locale.h>

int main() {

setlocale(LC_ALL,"Portuguese");

int num;
printf("Digite um número: ");
scanf("%d", &num);
if (num > 0) {
printf("O número é positivo\n");
} else if (num < 0) {
printf("O número é negativo\n");
} else {
printf("O número é zero\n");
}
return 0;
}