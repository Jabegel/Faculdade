/*
08. Escreva um programa que utilize um loop for 
para imprimir todos os múltiplos de 7 entre 1 e 100
*/
#include <stdio.h>

int main()
{
    int n;
    
    for( n = 1; n < 100; n++){
        if( n % 7 == 0)
        printf("%d ",n);
    }

    return 0;
}