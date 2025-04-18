#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include "mercado.h"

static int contador_produto = 0;
static int contador_carrinho = 0;
static Carrinho carrinho[50];
static Produto produtos[50];

void infoProduto(Produto prod) {
    printf("Cód: %d \nNome: %s \nPreço: %.2f\n", prod.codigo, prod.nome, prod.preco);
}

void menu() {
    printf("================ Bem-vindo(a) - Solução Mercado ===========\n");
    printf("Selecione uma opção abaixo: \n");
    printf("1 - Cadastrar produto\n");
    printf("2 - Listar produtos\n");
    printf("3 - Comprar produto\n");
    printf("4 - Visualizar carrinho\n");
    printf("5 - Fechar pedido\n");
    printf("6 - Sair do sistema\n");

    int opcao;
    scanf("%d", &opcao);
    getchar();

    switch (opcao) {
        case 1:
            cadastrarProduto();
            break;
        case 2:
            listarProdutos();
            break;
        case 3:
            comprarProduto();
            break;
        case 4:
            visualizarCarrinho();
            break;
        case 5:
            fecharPedido();
            break;
        case 6:
            printf("Volte sempre!\n");
            sleep(2);
            exit(0);
        default:
            printf("Opção inválida.\n");
            sleep(2);
            menu();
            break;
    }
}

void cadastrarProduto() {
    printf("Cadastro de Produto\n");
    printf("====================\n");

    printf("Informe o nome do produto: \n");
    fgets(produtos[contador_produto].nome, 30, stdin);
    produtos[contador_produto].nome[strcspn(produtos[contador_produto].nome, "\n")] = 0;

    printf("Informe o preço do produto: \n");
    scanf("%f", &produtos[contador_produto].preco);

    printf("O produto %s foi cadastrado com sucesso.\n", produtos[contador_produto].nome);
    produtos[contador_produto].codigo = (contador_produto + 1);
    contador_produto++;
    sleep(2);
    menu();
}

void listarProdutos() {
    if(contador_produto > 0) {
        printf("Listagem de produtos.\n");
        printf("---------------------\n");
        for(int i = 0; i < contador_produto; i++) {
            infoProduto(produtos[i]);
            printf("------------------\n");
            sleep(1);
        }
        sleep(2);
        menu();
    } else {
        printf("Não temos ainda produtos cadastrados.\n");
        sleep(2);
        menu();
    }
}

void comprarProduto() {
    if(contador_produto > 0) {
        printf("Informe o código do produto que deseja adicionar ao carrinho.\n");

        printf("========== Produtos Disponíveis ===========\n");
        for(int i = 0; i < contador_produto; i++) {
            infoProduto(produtos[i]);
            printf("---------------------\n");
            sleep(1);
        }
        int codigo;
        scanf("%d", &codigo);
        getchar();

        int tem_mercado = 0;
        for(int i = 0; i < contador_produto; i++) {
            if(produtos[i].codigo == codigo) {
                tem_mercado = 1;

                if(contador_carrinho > 0) {
                    int * retorno = temNoCarrinho(codigo);

                    if(retorno[0] == 1) {
                        carrinho[retorno[1]].quantidade++;
                        printf("Aumentei a quantidade do produto %s já existente no carrinho.\n",
                                strtok(carrinho[retorno[1]].produto.nome, "\n"));
                        sleep(2);
                        menu();
                    } else {
                        Produto p = pegarProdutoPorCodigo(codigo);
                        carrinho[contador_carrinho].produto = p;
                        carrinho[contador_carrinho].quantidade = 1;
                        contador_carrinho++;
                        printf("O produto %s foi adicionado ao carrinho.\n", strtok(p.nome, "\n"));
                        sleep(2);
                        menu();
                    }
                } else {
                    Produto p = pegarProdutoPorCodigo(codigo);
                    carrinho[contador_carrinho].produto = p;
                    carrinho[contador_carrinho].quantidade = 1;
                    contador_carrinho++;
                    printf("O produto %s foi adicionado ao carrinho.\n", strtok(p.nome, "\n"));
                    sleep(2);
                    menu();
                }
            }
        }
        if(tem_mercado < 1) {
            printf("Não foi encontrado o produto com código %d.\n", codigo);
            sleep(2);
            menu();
        }
    } else {
        printf("Ainda não existem produtos para vender.\n");
        sleep(2);
        menu();
    }
}

void visualizarCarrinho() {
    if(contador_carrinho > 0) {
        printf("Produtos do Carrinho\n");
        printf("--------------------\n");
        for(int i = 0; i < contador_carrinho; i++) {
            infoProduto(carrinho[i].produto);
            printf("Quantidade: %d\n", carrinho[i].quantidade);
            printf("-----------------\n");
            sleep(1);
        }
        sleep(2);
        menu();
    } else {
        printf("Não temos ainda produtos no carrinho.\n");
        sleep(2);
        menu();
    }
}

Produto pegarProdutoPorCodigo(int codigo) {
    Produto p;
    for(int i = 0; i < contador_produto; i++) {
        if(produtos[i].codigo == codigo) {
            p = produtos[i];
        }
    }
    return p;
}

int * temNoCarrinho(int codigo) {
    static int retorno[] = {0, 0};
    for(int i = 0; i < contador_carrinho; i++) {
        if(carrinho[i].produto.codigo == codigo) {
            retorno[0] = 1; //tem o produto com este código no carrinho
            retorno[1] = i; //o índice do produto no carrinho
        }
    }
    return retorno;
}

void fecharPedido() {
    if(contador_carrinho > 0) {
        float valorTotal = 0.0;
        printf("Produtos do Carrinho\n");
        printf("--------------------\n");
        for(int i = 0; i < contador_carrinho; i++) {
            Produto p = carrinho[i].produto;
            int quantidade = carrinho[i].quantidade;
            valorTotal += p.preco * quantidade;
            infoProduto(p);
            printf("Quantidade: %d\n", quantidade);
            printf("---------------\n");
            sleep(1);
        }
        printf("Sua fatura é R$ %.2f\n", valorTotal);

        //limpar carrinho
        contador_carrinho = 0;
        printf("Obrigado pela preferência.\n");
        sleep(5);
        menu();
    } else {
        printf("Você não tem nenhum produto no carrinho ainda.\n");
        sleep(3);
        menu();
    }
}
