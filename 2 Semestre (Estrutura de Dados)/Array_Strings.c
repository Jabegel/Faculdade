#include <stdio.h>
#include <string.h>

int main() {
    int num_cidades;
    printf("Quantas cidades deseja armazenar? ");
    scanf("%d", &num_cidades);
    
    char cidades[num_cidades][50];
    for (int i = 0; i < num_cidades; i++) {
        printf("Digite o nome da cidade %d: ", i + 1);
        scanf("%49s", cidades[i]);
    }
    
    char pesquisa[50];
    int encontrada = 0;

    printf("Digite o nome da cidade que deseja pesquisar: ");
    scanf("%49s", pesquisa);

    for (int i = 0; i < num_cidades; i++) {
        if (strcmp(cidades[i], pesquisa) == 0) {
            encontrada = 1;
            break;
        }
    }

    if (encontrada) {
        printf("A cidade %s esta na lista.\n", pesquisa);
    } else {
        printf("A cidade %s nao esta na lista.\n", pesquisa);
    }
    
    return 0;
}
