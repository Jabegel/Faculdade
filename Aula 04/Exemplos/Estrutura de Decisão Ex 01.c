#include <stdio.h>
#include <locale.h>

int main() {

setlocale(LC_ALL,"Portuguese");

int num;
printf("Digite um n�mero: ");
scanf("%d", &num);
if (num > 0) {
printf("O n�mero � positivo\n");
} else if (num < 0) {
printf("O n�mero � negativo\n");
} else {
printf("O n�mero � zero\n");
}
return 0;
}