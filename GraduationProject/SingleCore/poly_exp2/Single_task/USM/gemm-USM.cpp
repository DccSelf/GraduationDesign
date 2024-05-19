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

			for(size_t k = 0; k < NK; k++) {
				C[i * NJ + j] += ALPHA * A[i * NK + k] * B[k * NJ + j];
			}
		}

		//PolyBenC写法
		// for(size_t j=0;j<NJ;j++)
		// {
		// 	C[i * NJ + j] *= BETA;
		// }
		// for(size_k=0;k<NK;k++)
		// {
		// 	for(size_t j=0;j<NJ;j++)
		// 	{
		// 		C[i * NJ + j] += ALPHA * A[i * NK + k] * B[k * NJ + j];
		// 	}
		// }
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

        A_usm = malloc_device<DATA_TYPE>(size*size,args.device_queue);
        B_usm = malloc_device<DATA_TYPE>(size*size,args.device_queue);
        C_usm = malloc_device<DATA_TYPE>(size*size,args.device_queue);
        //copy host_data:input to device
		
		//初始化对计算密集型任务的性能提升几乎没有帮助，对带宽有很大帮助。
		int USM = size * size;
        args.device_queue.submit([&](cl::sycl::handler& h){
			auto in_d = A_usm;
            auto in_h = &A[0];
            h.single_task([=,N=USM](){
				for(int i=0;i<N;i++)
				{
					in_d[i] = in_h[i];
				}
            });;
        }).wait();

        args.device_queue.submit([&](cl::sycl::handler& h){
            auto in_d = B_usm;
            auto in_h = &B[0];
            h.single_task([=,N=USM](){
              for(int i=0;i<N;i++)
				{
					in_d[i] = in_h[i];
				}
            });;
        }).wait();

        args.device_queue.submit([&](cl::sycl::handler& h){
            auto in_d = C_usm;
            auto in_h = &C[0];
            h.single_task([=,N=USM](){
              for(int i=0;i<N;i++)
				{
					in_d[i] = in_h[i];
				}
            });;
        }).wait();


		// A_buffer.initialize(args.device_queue, A.data(), cl::sycl::range<2>(size, size));
		// B_buffer.initialize(args.device_queue, B.data(), cl::sycl::range<2>(size, size));
		// C_buffer.initialize(args.device_queue, C.data(), cl::sycl::range<2>(size, size));
	}

	void run(std::vector<cl::sycl::event>& events) {
		using namespace cl::sycl;

        auto A_ = A_usm;
        auto B_ = B_usm;
        auto C_ = C_usm;
        events.push_back(args.device_queue.single_task([=,NI_=size,NJ_=size,NK_=size](){
            for(size_t i = 0; i < NI_; i++) {
				for(size_t j = 0;j < NJ_; j++)
				{
					C_[i*NI_ + j] *= BETA;
				}
				for(size_t k = 0;k < NK_; k++)
				{
					for(size_t j = 0;j < NJ_; j++)
					{
						C_[i*NI_+j] += ALPHA * A_[i*NI_ + k] * B_[k*NK_+j];
					}
				}
			}
        }));

		// events.push_back(args.device_queue.submit([&](handler& cgh) {
		// 	auto A = A_buffer.get_access<access::mode::read>(cgh);
		// 	auto B = B_buffer.get_access<access::mode::read>(cgh);
		// 	auto C = C_buffer.get_access<access::mode::read_write>(cgh);
		// 	cgh.single_task<Gemm>([=,NI_ = size,NJ_ = size,NK_ = size](){
		// 		for(size_t i = 0; i < NI_; i++) {
		// 			for(size_t j = 0;j < NJ_; j++)
		// 			{
		// 				C[{i,j}] *= BETA;
		// 			}
		// 			for(size_t k = 0;k < NK_; k++)
		// 			{
		// 				for(size_t j = 0;j < NJ_; j++)
		// 				{
		// 					C[{i,j}] += ALPHA * A[{i,k}] * B[{k,j}];
		// 				}
		// 			}
		// 		}
				
		// 	});
		//}));
	}

	bool verify(VerificationSetting&) {
		constexpr auto ERROR_THRESHOLD = 0.05;

		std::vector<DATA_TYPE> C_cpu(size * size);

		init(A.data(), B.data(), C_cpu.data(), size);

		gemm(A.data(), B.data(), C_cpu.data(), size);

		for(size_t i = 0; i < size; i++) {
			for(size_t j = 0; j < size; j++) {
				const auto diff = percentDiff(C_cpu[i * size + j], C_usm[i * size + j]);
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

    DATA_TYPE *A_usm;
    DATA_TYPE *B_usm;
    DATA_TYPE *C_usm;

	// PrefetchedBuffer<DATA_TYPE, 2> A_buffer;
	// PrefetchedBuffer<DATA_TYPE, 2> B_buffer;
	// PrefetchedBuffer<DATA_TYPE, 2> C_buffer;
};

int main(int argc, char** argv) {
	BenchmarkApp app(argc, argv);
	app.run<Polybench_Gemm>();
	return 0;
}
