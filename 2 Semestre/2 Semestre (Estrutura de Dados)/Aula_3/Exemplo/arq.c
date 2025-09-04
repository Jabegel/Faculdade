float soma(float num_1, float num_2) {
    return num_1 + num_2;
}

float menos(float num_1, float num_2) {
    return num_1 - num_2;
}

float mult(float num_1, float num_2) {
    return num_1 * num_2;
}

float divisao(float num_1, float num_2) {
    if (num_2 != 0)
        return num_1 / num_2;
    else {
        printf("Erro: Divisao por zero!\n");
        return 0;
    }
}