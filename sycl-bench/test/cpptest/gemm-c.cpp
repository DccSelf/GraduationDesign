#include <chrono>
#include <string>
#include <vector>

// #include <CL/sycl.hpp>
#include <cstdlib>
#include <iostream>


// using namespace cl::sycl;

using DATA_TYPE = float;


void init(DATA_TYPE* A, DATA_TYPE* B, DATA_TYPE* C, size_t size) {
  const auto NI = size;
  const auto NJ = size;
  const auto NK = size;

  for(size_t i = 0; i < NI; i++) {
    for(size_t j = 0; j < NK; j++) { // M  K
      A[i * NK + j] = ((DATA_TYPE)i * j) / NI;
    }
  }

  for(size_t i = 0; i < NK; i++) {
    for(size_t j = 0; j < NJ; j++) { // K  N
      B[i * NJ + j] = ((DATA_TYPE)i * j + 1) / NJ;
    }
  }

  for(size_t i = 0; i < NI; i++) {
    for(size_t j = 0; j < NJ; j++) { // M  N
      C[i * NJ + j] = ((DATA_TYPE)i * j + 2) / NJ;
    }
  }
}

void gemm(DATA_TYPE* A, DATA_TYPE* B, DATA_TYPE* C, size_t M,size_t K,size_t N) {
  for(size_t i = 0; i < M; i++) { //M 
    for(size_t j = 0; j < N; j++) {//N
      for(size_t k = 0; k < K; k++) {//K
        C[i * N + j] +=  A[i * K + k] * B[k * N + j]; //
      }
    }
  }
}


int main() {
  const size_t size = 512;
  std::vector<DATA_TYPE> A(size * size);//M K
  std::vector<DATA_TYPE> B(size * size);//K N
  std::vector<DATA_TYPE> C(size * size);//M N

  init(A.data(), B.data(), C.data(), size);

  const auto before = std::chrono::system_clock::now();
  gemm(A.data(), B.data(), C.data(), size,size,size);
  const auto after = std::chrono::system_clock::now();

  std::chrono::duration<double> duration = (after - before);

  std::cout << "run-time: " << duration.count() << std::endl;

  double output = static_cast<double>(2 * size * size * size) * 1.0e-9 / duration.count();

  std::cout << "GFlops: " << output << std::endl;

  return 0;
}
