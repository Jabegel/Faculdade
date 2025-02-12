/*
14. Escreva um algoritmo que calcule o montante final de um
investimento com juros simples, dados o capital inicial, 
a taxa de juros (em porcentagem) e o período de tempo (em anos).

 J = C ∙ i ∙ t
 M = C + J
*/

#include <stdio.h>

int main() {
    float juros_simples, capital_inicial, taxa_de_juros;
    int tempo;

    printf("Digite o Capital Inicial:\n");
    scanf("%f", &capital_inicial);
    
    printf("Digite a Taxa de Juros (em porcentagem):\n");
    scanf("%f", &taxa_de_juros);
    
    printf("Digite o Tempo em Anos:\n");
    scanf("%d", &tempo);
    
    taxa_de_juros = taxa_de_juros / 100.0;
    
    float juros_final = capital_inicial * taxa_de_juros * tempo;
    float montante_final = capital_inicial + juros_final;
    
    printf("O seu investimento de R$ %.2f, com a taxa de juros de %.2f%%, durante %d anos, resultou em R$ %.2f, com total de juros R$%.2f\n",
           capital_inicial, taxa_de_juros * 100, tempo, montante_final,juros_final);
    
    return 0;
}