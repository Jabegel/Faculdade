#include <stdio.h>

int main()
{
    int tamanho;

    printf("Informe o tamanho da fila: ");
    scanf("%d", &tamanho);

    int fila[tamanho];
    int frente = 0;
    int tras = 0;
    int opcao, valor;

    while (tras < tamanho)
    {
        printf("Digite um número para inserir na fila (%d/%d): ", tras + 1, tamanho);
        scanf("%d", &valor);
        fila[tras] = valor;
        tras++;
    }

    do
    {
        printf("\n--- MENU ---\n");
        printf("1. Mostrar Fila\n");
        printf("2. Apagar toda a Fila\n");
        printf("3. Apagar o último da Fila\n");
        printf("4. Sair\n");
        printf("----------------\n");
        printf("Escolha uma opção: ");
        scanf("%d", &opcao);
        printf("----------------\n");

        switch (opcao)
        {
        case 1:
            if (frente == tras)
            {
                printf("Fila está vazia.\n");
            }
            else
            {
                printf("Fila: ");
                for (int i = frente; i < tras; i++)
                {
                    printf("%d ", fila[i]);
                }
                printf("\n");
            }
            break;

        case 2:
            if (frente == tras)
            {
                printf("Fila já está vazia.\n");
            }
            else
            {
                frente = 0;
                tras = 0;
                printf("Fila apagada com sucesso.\n");
            }
            break;

        case 3:
            if (frente == tras)
            {
                printf("Fila está vazia. Nada para remover.\n");
            }
            else
            {
                tras--;
                printf("Último valor removido da fila. Valor: %d\n", fila[tras]);
            }
            break;

        case 4:
            printf("Encerrando o programa.\n");
            break;

        default:
            printf("Opção inválida. Tente novamente.\n");
        }

    } while (opcao != 4);

    return 0;
}
