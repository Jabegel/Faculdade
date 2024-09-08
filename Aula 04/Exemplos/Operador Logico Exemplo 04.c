#include <stdio.h>
#include <locale.h>

int main() {

setlocale(LC_ALL,"Portuguese_Brazil");

int a = 10, b = 5, c = 15;
if (a > b && a < c) {
printf("A ? maior que B e menor que C\n");
}
if (a > b || b > c) {
printf("A ? maior que B ou B ? maior que C\n");
}
if (!(a < b)) {
printf("A n?o ? menor que B\n");
}
return 0;
}
