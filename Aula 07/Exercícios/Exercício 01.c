/*

*/


#include <stdio.h>

int main()
{
    int numeros[5]; 
    int soma; 
    
    for (int i = 0; i < 5; i++){
        printf("Digite um numero:");
        scanf("%d",&numeros[i]);
        soma += numeros[i];
    }
    
    printf("Soma dos valores do vetor:%d", soma);
    
    return 0;
}