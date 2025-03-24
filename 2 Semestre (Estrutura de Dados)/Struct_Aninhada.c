#include <stdio.h>

typedef struct {
    char rua[50];
    int numero;
    char cidade[50];
} Endereco;

typedef struct {
    char nome[50];
    int idade;
    Endereco endereco;
} Pessoa;

int main() {
    Pessoa pessoa;
    
    printf("Digite o nome da pessoa: ");
    scanf("%49s", pessoa.nome);
    printf("Digite a idade da pessoa: ");
    scanf("%d", &pessoa.idade);
    printf("Digite a rua: ");
    scanf("%49s", pessoa.endereco.rua);
    printf("Digite o numero: ");
    scanf("%d", &pessoa.endereco.numero);
    printf("Digite a cidade: ");
    scanf("%49s", pessoa.endereco.cidade);
    
    printf("\nDados cadastrados:\n");
    printf("Nome: %s\n", pessoa.nome);
    printf("Idade: %d\n", pessoa.idade);
    printf("Endereco: Rua %s, Casa %d, cidade %s\n", pessoa.endereco.rua, pessoa.endereco.numero, pessoa.endereco.cidade);
    
    return 0;
}
