#include <stdio.h>

char tabuleiro[3][3];
char jogadorX[50], jogadorO[50];

void abrirTabuleiro() {
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            tabuleiro[i][j] = ' ';
        }
    }
}

void exibirTabuleiro() {
    printf("\n");
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            printf(" %c ", tabuleiro[i][j]);
            if (j < 2) printf("|");
        }
        printf("\n");
        if (i < 2) printf("---|---|---\n");
    }
    printf("\n");
}

int verificarVitoria(char jogador) {
    for (int i = 0; i < 3; i++) {
        if (tabuleiro[i][0] == jogador && tabuleiro[i][1] == jogador && tabuleiro[i][2] == jogador) return 1;
        if (tabuleiro[0][i] == jogador && tabuleiro[1][i] == jogador && tabuleiro[2][i] == jogador) return 1;
    }
    if (tabuleiro[0][0] == jogador && tabuleiro[1][1] == jogador && tabuleiro[2][2] == jogador) return 1;
    if (tabuleiro[0][2] == jogador && tabuleiro[1][1] == jogador && tabuleiro[2][0] == jogador) return 1;
    return 0;
}

int velha() {
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
            if (tabuleiro[i][j] == ' ') return 0;
        }
    }
    return 1;
}

int main() {
    int linha, coluna;
    char jogador = 'X';
    
    printf("Digite o nome do jogador que usara X: ");
    scanf("%s", jogadorX);
    printf("Digite o nome do jogador que usara O: ");
    scanf("%s", jogadorO);
    
    abrirTabuleiro();
    
    int jogoEmAndamento = 1;

    while (jogoEmAndamento) {
        exibirTabuleiro();

        // Verificando quem é o jogador atual
        if (jogador == 'X') {
            printf("Jogador %c (%s), digite linha e coluna (0-2): ", jogador, jogadorX);
        } else {
            printf("Jogador %c (%s), digite linha e coluna (0-2): ", jogador, jogadorO);
        }

        scanf("%d %d", &linha, &coluna);
        
        if (linha < 0 || linha > 2 || coluna < 0 || coluna > 2 || tabuleiro[linha][coluna] != ' ') {
            printf("Jogada inválida! Tente novamente.\n");
            continue;
        }
        
        tabuleiro[linha][coluna] = jogador;
        
        if (verificarVitoria(jogador)) {
            exibirTabuleiro();
            if (jogador == 'X') {
                printf("%s venceu!\n", jogadorX);
            } else {
                printf("%s venceu!\n", jogadorO);
            }
            jogoEmAndamento = 0;  // Termina o jogo
        }
        
        if (velha()) {
            exibirTabuleiro();
            printf("Empate!\n");
            jogoEmAndamento = 0;  // Termina o jogo
        }
        
        // Alterando o jogador
        if (jogador == 'X') {
            jogador = 'O';
        } else {
            jogador = 'X';
        }
    }

    return 0;
}
