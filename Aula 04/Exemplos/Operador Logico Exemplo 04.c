#include <stdio.h>
#include <locale.h>

int main() {

setlocale(LC_ALL,"Portuguese_Brazil");

int a = 10, b = 5, c = 15;
if (a > b && a < c) {
printf("A é maior que B e menor que C\n");
}
if (a > b || b > c) {
printf("A é maior que B ou B é maior que C\n");
}
if (!(a < b)) {
printf("A não é menor que B\n");
}
return 0;
}