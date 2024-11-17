/*
09. Escreva um programa que leia um número inteiro positivo N
e utilize um loop for para calcular a soma dos quadrados dos números de 1 a N
*/
#include <stdio.h>

int main(){
    
    int N;
    int soma = 0;
    
    printf("Digite um numero:");
    scanf("%d",&N);
    
    if(N < 0){
        printf("Numero Negativo, insira um numero inteiro");
    }
    
    for(int i = 1; i <= N; i++){
        soma += i * i;
    }
    printf("A soma dos quadrados de 1 a %d: %d", N,soma);
    
    return 0;
}