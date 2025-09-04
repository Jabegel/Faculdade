#include <stdio.h>
int main() {
int i, j;
// Este loop imprime os números de 1 a 5
for(i = 1; i <= 5; i++) {
printf("%d ", i);
}
printf("\n");
// Este loop imprime os números pares de 0 a 10
for(j = 0; j <= 10; j += 2) {
printf("%d ", j);
}
printf("\n");
return 0;
}