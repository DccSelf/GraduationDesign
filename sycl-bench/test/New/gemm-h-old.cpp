
#include <string>
#include <vector>

#include <cstdlib>

#include <CL/sycl.hpp>

#include "common.h"
#include "polybenchUtilFuncts.h"

#define ALPHA 1
#define BETA 0

using DATA_TYPE = float;

class Gemm;

void init(DATA_TYPE* A, DATA_TYPE* B, DATA_TYPE* C, size_t size) {
  const auto NI = size;
  const auto NJ = size;
  const auto NK = size;

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

void gemm(DATA_TYPE* A, DATA_TYPE* B, DATA_TYPE* C, size_t size) {
  const auto NI = size;
  const auto NJ = size;
  const auto NK = size;

  for(size_t i = 0; i < NI; i++) {
    for(size_t j = 0; j < NJ; j++) {
      //C[i * NJ + j] *= BETA; // NI*NJ

      for(size_t k = 0; k < NK; ++k) {
        C[i * NJ + j] += A[i * NK + k] * B[k * NJ + j]; // 2*NK*NI*NJ NK*NI*NJ
      }
    }
  }
}

class Polybench_Gemm {
public:
  Polybench_Gemm(const BenchmarkArgs& args) : args(args), size(args.problem_size) {}

  void setup() {
    A.resize(size * size);
    B.resize(size * size);
    C.resize(size * size);

    init(A.data(), B.data(), C.data(), size);

    A_buffer.initialize(args.device_queue, A.data(), cl::sycl::range<2>(size, size));
    B_buffer.initialize(args.device_queue, B.data(), cl::sycl::range<2>(size, size));
    C_buffer.initialize(args.device_queue, C.data(), cl::sycl::range<2>(size, size));
  }

  void run(std::vector<cl::sycl::event>& events) {
    using namespace cl::sycl;

    events.push_back(args.device_queue.submit([&](handler& cgh) {
      auto A = A_buffer.get_access<access::mode::read>(cgh);
      auto B = B_buffer.get_access<access::mode::read>(cgh);
      auto C = C_buffer.get_access<access::mode::read_write>(cgh);

      //cl::sycl::range global{size, size};
      //cl::sycl::range local{local_size, local_size};

      //   cgh.parallel_for(cl::sycl::nd_range{global, local}, [=, NJ_ = size](cl::sycl::nd_item<2> idx) {
      //     auto i = idx.get_global_id(0);
      //     auto k = idx.get_global_id(1);
      //     for(size_t j = 0; j < NJ_; j++) {
      //       C[{i, j}] += A[{i, k}] * B[{k, j}];
      //     }
      //   });


      cl::sycl::range num_groups{size / 64, size / 64};
      cl::sycl::range group_size{64, 64};
      cgh.parallel_for_work_group<Gemm>(num_groups, group_size, [=, NJ_ = size](cl::sycl::group<2> idx) {
        auto ib = idx.get_group_id(0);
        auto jb = idx.get_group_id(1);
        idx.parallel_for_work_item([&](cl::sycl::h_item<2> it) {
          auto i = ib * 64 + it.get_local_id(0);
          auto j = jb * 64 + it.get_local_id(1);
          for(size_t k = 0; k < NJ_; k++) {
            C[{i, j}] +=  A[{i, k}] * B[{k, j}];
          }
        });
      });


      //   cgh.parallel_for<Gemm>(C_buffer.get_range(), [=, NK_ = size](item<2> item) {
      //     const auto i = item[0];
      //     const auto j = item[1];

      //     C[item] *= BETA; // NI*NJ 乘法

      //     for(size_t k = 0; k < NK_; k++) {
      //       C[item] += ALPHA * A[{i, k}] * B[{k, j}]; // NK*NI*NJ+2*NK*(NI*NJ)
      //     }
      //   });
    }));
  }

  bool verify(VerificationSetting&) {
    constexpr auto ERROR_THRESHOLD = 0.05;

    // Trigger writeback
    C_buffer.reset();

    std::vector<DATA_TYPE> C_cpu(size * size);

    init(A.data(), B.data(), C_cpu.data(), size);

    gemm(A.data(), B.data(), C_cpu.data(), size);

    for(size_t i = 0; i < size; i++) {
      for(size_t j = 0; j < size; j++) {
        const auto diff = percentDiff(C_cpu[i * size + j], C[i * size + j]);
        if(diff > ERROR_THRESHOLD)
          return false;
      }
    }

    return true;
  }

  static std::string getBenchmarkName() { return "Polybench_Gemm"; }

private:
  BenchmarkArgs args;

  const size_t size;
  const size_t local_size = 64;
  std::vector<DATA_TYPE> A;
  std::vector<DATA_TYPE> B;
  std::vector<DATA_TYPE> C;

  PrefetchedBuffer<DATA_TYPE, 2> A_buffer;
  PrefetchedBuffer<DATA_TYPE, 2> B_buffer;
  PrefetchedBuffer<DATA_TYPE, 2> C_buffer;
};

int main(int argc, char** argv) {
  BenchmarkApp app(argc, argv);
  app.run<Polybench_Gemm>();
  return 0;
}

