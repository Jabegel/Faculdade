/*
03. Escreva um programa que leia um número inteiro
e utilize um loop for para imprimir a tabuada desse número de 1 a 10
*/

#include<stdio.h>

int main(){

    int N;

    printf("Digite seu numero:");
    scanf("%d", &N);

    if(N < 0){
        printf("Numero Invalido\n");
    } else

    for( int i = 1; i <=10; i++)
     printf("%d * %d = %d\n", N, i, N*i);

    return 0;    
}