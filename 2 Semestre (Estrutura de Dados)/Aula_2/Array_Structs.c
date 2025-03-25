#include <stdio.h>

typedef struct {
    char titulo[50];
    char autor[50];
    int ano;
} Livro;

int main() {
    int max_livros;
    printf("Quantos livros deseja cadastrar? ");
    scanf("%d", &max_livros);
    
    Livro livros[max_livros];
    int count = 0;
    char opcao;
    
    do {
        if (count >= max_livros) {
            printf("Voce atingiu o limite de livros cadastrados (%d). Deseja continuar? (s/n): ", max_livros);
            scanf(" %c", &opcao);
            if (opcao == 'n' || opcao == 'N') {
                break;
            }
            continue;
        }
        
        printf("Digite o título do livro: ");
        scanf("%49s", livros[count].titulo);
        printf("Digite o autor do livro: ");
        scanf("%49s", livros[count].autor);
        printf("Digite o ano de publicacao: ");
        scanf("%d", &livros[count].ano);
        count++;
        
        printf("Deseja cadastrar outro livro? (s/n): ");
        scanf(" %c", &opcao);
        
    } while (opcao == 's' || opcao == 'S');
    
    printf("\nCatalogo de Livros:\n");
    for (int i = 0; i < count; i++) {
        printf("%d. %s - %s (%d)\n", i + 1, livros[i].titulo, livros[i].autor, livros[i].ano);
    }
    
    return 0;
}
