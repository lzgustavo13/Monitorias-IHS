#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

#define N 2  // Dimensão das matrizes

void multiplica(int A[N][N], int B[N][N], int C[N][N]){
	int i,j,k;

	#pragma omp parallel for num_threads(4) private(i, j, k) shared(A, B, C)
	for(i = 0; i < N; i++){
		for(j = 0; j < N; j++){
			C[i][j] = 0;
			for(k = 0; k < N; k++){
				C[i][j] += A[i][k] * B[k][j];
			}
		}
	}
}

void printar(int A[N][N]){
	printf("Matriz resultante: \n");
	for(int i = 0; i < N; i++){
		for(int j = 0; j < N; j++){
		printf("%d ", A[i][j]);
		}
	printf("\n");
	}
}

int main(){
	int A[N][N] = {{1,2}, {3,4}};
	int B[N][N] = {{4,3}, {2,1}};
	int C[N][N];
	multiplica(A,B,C);
	printar(C);
	return 0;
}
