#include "hash.h"

int vetor[MAX];

void criar_vetor() {
	int i;
	for(i = 0; i < MAX; i++){
		vetor[i] = -1;
	}
}

void inserir_vetor(int valor) {
	int chave = valor % MAX;

	if(vetor[chave] == -1) {
		vetor[chave] = valor;
	} else {
		printf("Eroo: Houve colisão!\n");
	}
}

void deletar_vetor(int valor) {
	int chave = valor % MAX;
	if(vetor[chave] == valor){
		vetor[chave] = -1;
	}
}

int procura_vetor(int valor){
	int chave = valor % MAX;
	int procura;
	if(vetor[chave] == valor){
		procura = chave;
	} else {
		procura = -1;
	}
}

void imprimir_vetor(){
	int i;
	printf("Tabela Hash:\n");
	for(i = 0; i < MAX; i++){
        	printf("vetor[%d] = %d\n", i, vetor[i]);
    	}
	printf("--------------------------------\n");
}

void alterar_valor(int antigo, int novo) {
	int chave = procura_vetor(antigo);
	if(chave != -1) {
		vetor[chave] = novo;
	} else {
		printf("Erro: Valor não existe!\n");
	}
}

int main(void){
	criar_vetor();
	inserir_vetor(22);
	inserir_vetor(80);
	inserir_vetor(33);
	inserir_vetor(100);
	imprimir_vetor();
	deletar_vetor(80);
	imprimir_vetor();
	procura_vetor(22);
	alterar_valor(100, 90);
	imprimir_vetor();
}
