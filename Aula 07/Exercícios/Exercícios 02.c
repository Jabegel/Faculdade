/*
leia as notas de 5 alunos e armazene-as em um vetor. Em seguida, encontre e imprima a média das notas
*/
#include <stdio.h>

int main()
{
    int numeros[5]; 
    float soma; 
    float divisao;
    
    for (int i = 0; i < 5; i++){
        printf("Digite um numero:");
        scanf("%d",&numeros[i]);
        soma += numeros[i];
    }
    
     divisao = soma / 5;
     
    printf("A media dos valores do vetor:%.2f", divisao);
    
    return 0;
}