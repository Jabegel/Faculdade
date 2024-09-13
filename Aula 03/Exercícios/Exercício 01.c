/*
1. Faça um algoritmo que receba a idade de uma pessoa e verifique se ela é maior de
idade ou não.
*/


#include<stdio.h>

int main(){

int a;
printf("Digite sua idade:");
scanf("%d",&a);

if(a >= 18){
printf("Maior de Idade");
}

else { 
    printf("Nao e Maior de Idade");
}


return 0;
}