#include <string>
#include <vector>

#include <cstdlib>

#include <CL/sycl.hpp>

#include "common.h"
#include "polybenchUtilFuncts.h"

#define ALPHA 32412
#define BETA 2123

using DATA_TYPE = float;

class Gemm;

void init(DATA_TYPE* A, DATA_TYPE* B, DATA_TYPE* C, size_t size) {
	const auto NI = size;
	const auto NJ = size;
	const auto NK = size;

	for(size_t i = 0; i < NI; i++) {
		for(size_t j = 0; j < NK; j++) {
			A[i * NK + j] = ((DATA_TYPE)i * j) / NI;
		}
	}

	for(size_t i = 0; i < NK; i++) {
		for(size_t j = 0; j < NJ; j++) {
			B[i * NJ + j] = ((DATA_TYPE)i * j + 1) / NJ;
		}
	}

	for(size_t i = 0; i < NI; i++) {
		for(size_t j = 0; j < NJ; j++) {
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
			C[i * NJ + j] *= BETA;

			for(size_t k = 0; k < NK; ++k) {
				C[i * NJ + j] += ALPHA * A[i * NK + k] * B[k * NJ + j];
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
          
          size_t tile_size = 512; //local_size
          cl::sycl::range num_groups{args.problem_size,args.problem_size/tile_size};
          cl::sycl::range group_size{1,tile_size};

          cgh.parallel_for_work_group<Gemm>(num_groups,group_size, [=, NK_ = size](cl::sycl::group<2> group) {

            group.parallel_for_work_item([&](h_item<2> item){
                    size_t m =item.get_global_id()[0];
                    size_t n =item.get_global_id()[1];
                    C[{m,n}] *= BETA;
            });


            DATA_TYPE tileA[512];//tile_size  local memory

            for(size_t kk=0;kk<NK_ ;kk+=tile_size)
            {
                //auto insertly barrier

                //load matrix A
                group.parallel_for_work_item([&](h_item<2> item){
                    size_t m = item.get_global_id()[0];
                    size_t i = item.get_local_id()[1];
                    tileA[i] = A[{m,kk+i}];
                });

                //barrier

                group.parallel_for_work_item([&](h_item<2> item){
                    size_t m =item.get_global_id()[0];
                    size_t n =item.get_global_id()[1];
                    //C[{m,n}] *= BETA;
                    for(size_t k=0;k<tile_size;k++)
                    {
                        C[{m,n}] += ALPHA * tileA[k] * B[{kk+k,n}];
                    }

                });
                //barrier

            }
            

          });
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
				if(diff > ERROR_THRESHOLD) return false;
			}
		}

		return true;
	}

	static std::string getBenchmarkName() { return "Polybench_Gemm"; }

private:
	BenchmarkArgs args;

	const size_t size;
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
