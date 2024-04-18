#include <chrono>
#include <cstdlib>
#include <iostream>
#include <random>
#include <vector>
using std::vector;
using DATA_TYPE = float;

void initMatrix(DATA_TYPE* A, DATA_TYPE* B, DATA_TYPE* C, size_t NI, size_t NK, size_t NJ) {
  for(size_t i = 0; i < NI; i++) {
    for(size_t j = 0; j < NK; j++) { // NI  NK
      A[i * NK + j] = ((DATA_TYPE)i * j) / NI;
    }
  }

  for(size_t i = 0; i < NK; i++) {
    for(size_t j = 0; j < NJ; j++) { // NK  NJ
      B[i * NJ + j] = ((DATA_TYPE)i * j + 1) / NJ;
    }
  }

  for(size_t i = 0; i < NI; i++) {
    for(size_t j = 0; j < NJ; j++) { // NI  NJ
      C[i * NJ + j] = ((DATA_TYPE)i * j + 2) / NJ;
    }
  }
}

void matmul(DATA_TYPE* C, DATA_TYPE* A, DATA_TYPE* B, size_t M, size_t N, size_t K, size_t lda, size_t ldb, size_t ldc) {
  for(size_t i = 0; i < M; i++)
    for(size_t k = 0; k < K; k++)
      for(size_t j = 0; j < N; j++) C[i * ldc + j] += A[i * lda + k] * B[k * ldb + j];
}


int main(int argc, char** argv) {
  size_t M, N, K;
  if(argc != 4) {
    std::cerr << "./a.out <M> <N> <K>";
    exit(1);
  } else {
    M = strtol(argv[1], NULL, 10);
    N = strtol(argv[2], NULL, 10);
    K = strtol(argv[3], NULL, 10);
  }


  vector<DATA_TYPE> A(M * K);
  vector<DATA_TYPE> B(K * N);
  vector<DATA_TYPE> C(M * N);

  initMatrix(A.data(), B.data(), C.data(), M, K, N);

  auto start = std::chrono::system_clock::now();
  matmul(C.data(), A.data(), B.data(), M, N, K, K, N, N);
  auto end = std::chrono::system_clock::now();
  std::chrono::duration<double> elps = end - start;
  std::cout << "run-time: " << elps.count() << std::endl;
  double perf = static_cast<double>(2 * M * N * K) * 1e-9 / elps.count();
  std::cout << "Performance: " << perf << " GFlops" << std::endl;
}

