#include <stdio.h>
#include <locale.h>

//Escreva um programa que leia um número inteiro positivo N e utilize um loop for para imprimir os primeiros N números da sequência de Fibonacci.

int main () {

setlocale(LC_ALL,"Portuguese_Brazil");

int x, y=1, z=1, aux;

printf("Digite um número inteiro positivo N:");
scanf("%d",&x);

if(x<=0){

    printf("Número digitado inválido");

} else{ 
    
    for(int i = 1; i <= x; i++){
        
        if(i==1){
            printf("%d",i);
        }else if(i==2){
            printf("%d",i);
        }

        aux=y+z; 
        y=z;
        z=aux;
        printf("%d ", aux);
    }
}

return 0;

}