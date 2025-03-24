#include <stdio.h>

typedef struct {
    char nome[50];
    float nota1, nota2, nota3;
} Aluno;

float calcularMedia(Aluno aluno) {
    return (aluno.nota1 + aluno.nota2 + aluno.nota3) / 3;
}

int main() {
    Aluno aluno;
    
    printf("Digite o nome do aluno: ");
    scanf("%49s", aluno.nome);
    printf("Digite as tres notas do aluno: ");
    scanf("%f %f %f", &aluno.nota1, &aluno.nota2, &aluno.nota3);
    
    float media = calcularMedia(aluno);
    
    printf("Aluno: %s\n", aluno.nome);
    printf("Média: %.2f\n", media);
    
    return 0;
}