#include <CL/sycl.hpp>
#include <chrono>
#include <cmath>
#include <cstdlib>
#include <iostream>
#include <sys/time.h>
#include <vector>

namespace s = sycl;
using DATA_TYPE = float;


void initMatrix(DATA_TYPE* A, DATA_TYPE* B, DATA_TYPE* C, size_t NI, size_t NK, size_t NJ) {
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

void naiveMatmul(DATA_TYPE* C, DATA_TYPE* A, DATA_TYPE* B, size_t M, size_t N, size_t K) {
  for(int i = 0; i < M; i++) {
    for(int j = 0; j < N; j++) {
      for(int k = 0; k < K; k++) {
        C[i * N + j] += A[i * K + k] * B[k * N + j];
      }
    }
  }
}

bool verify(DATA_TYPE* C, DATA_TYPE* _C, size_t M, size_t N) {
  for(size_t i = 0; i < M * N; i++) {
    if(fabs(C[i] - _C[i]) > 1e-6)
      return false;
  }
  return true;
}

int main(int argc, char** argv) {
  size_t M, N, K;

  if(argc != 4) {
    std::cerr << argv[0] << " M, N, K" << std::endl;
    exit(1);
  } else {
    M = strtol(argv[1], NULL, 10);
    N = strtol(argv[2], NULL, 10);
    K = strtol(argv[3], NULL, 10);
  }

  s::queue q;
  auto A = s::malloc_shared<DATA_TYPE>(M * K, q);
  auto B = s::malloc_shared<DATA_TYPE>(K * N, q);
  auto C = s::malloc_shared<DATA_TYPE>(M * N, q);
  auto _C = s::malloc_host<DATA_TYPE>(M * N, q);

  initMatrix(A, B, C, M, K, N);
  initMatrix(A, B, _C, M, K, N);

  s::range num_groups{512/64,512/64};
  s::range group_size{64,64};
  auto start = std::chrono::system_clock::now();
  q.submit([&](s::handler& h) {
    h.parallel_for_work_group(num_groups,group_size,[=](s::group<2> idx) {
      size_t ib = idx.get_group_id(0);
      size_t jb = idx.get_group_id(1);
      idx.parallel_for_work_item([&](s::h_item<2> it){
        size_t i = ib*64 + it.get_local_id(0);
        size_t j = jb*64 + it.get_local_id(1); 
        for(size_t k = 0; k < K; k++) {
           C[i * N + j] += A[i * K + k] * B[k * N + j];
        }
        
      });
    });
  });
  auto end = std::chrono::system_clock::now();
  std::chrono::duration<double> elps = end - start;
  double perf = static_cast<double>(2 * M * N * K) * 1e-9 / elps.count();
  q.wait();

  naiveMatmul(_C, A, B, M, N, K);

  if(!verify(C, _C, M, N)) {
    std::cerr << "Invalid result" << std::endl;
    exit(1);
  }
  std::cout << "run-time: " << elps.count() << " s" << std::endl;
  std::cout << "Performance: " << perf << " GFlops" << std::endl;
  return 0;
}

