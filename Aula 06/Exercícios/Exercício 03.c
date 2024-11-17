/*3.Escreva um programa que solicita um número inteiro do usuário e exibe a tabuada desse número*/

#include <stdio.h>

int main(){

    int n1;

    printf("Digite seu numero:");
    scanf("%d", &n1);

    int contador = 0;
    do {
        printf("\n%d * %d = %d", n1, contador, n1 * contador);
        contador++;
    } while (contador <= 10);

    return 0;
}