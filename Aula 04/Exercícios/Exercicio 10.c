/*
10. Escreva um algoritmo que calcule o preço total de uma compra, 
dados o preço unitário de um produto e a quantidade comprada.
*/

#include <stdio.h>

int main() {
    
    char produto; 
    int quantidade;
    float preco;

    printf("Digite a Quantidade do Produto:");
    scanf("%d",&quantidade);
    
    printf("Digite o Preco do Produto:");
    scanf("%f",&preco);
    
    printf("Digite o Nome do Produto:");
    scanf("%c\n",&produto);
    
    float compra = preco * quantidade;
    
    printf("O Total da sua compra foi de R$ %.2f, sendo ela de %d , que esta no valor de %.2f",compra,quantidade,preco);
    
    
    return 0;
}