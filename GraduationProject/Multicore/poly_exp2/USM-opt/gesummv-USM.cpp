#include <string>
#include <vector>

#include <cstdlib>

#include <CL/sycl.hpp>

#include "common.h"
#include "polybenchUtilFuncts.h"

using DATA_TYPE = float;

class Gesummv;

constexpr DATA_TYPE ALPHA = 1;
constexpr DATA_TYPE BETA = 1;

void init(DATA_TYPE* A, DATA_TYPE* B, DATA_TYPE* x, size_t size) {
	const auto N = size;

	for(size_t i = 0; i < N; i++) {
		x[i] = 1;

		for(size_t j = 0; j < N; j++) {
			A[i * N + j] = 2;
			B[i * N + j] = 3;
		}
	}
}

void gesummv(DATA_TYPE* A, DATA_TYPE* B, DATA_TYPE* x, DATA_TYPE* y, DATA_TYPE* tmp, size_t size) {
	const auto N = size;

	for(size_t i = 0; i < N; i++) {
		tmp[i] = 0;
		y[i] = 0;
		for(size_t j = 0; j < N; j++) {
			tmp[i] = A[i * N + j] * x[j] + tmp[i];
			y[i] = B[i * N + j] * x[j] + y[i];
		}

		y[i] = ALPHA * tmp[i] + BETA * y[i];
	}
}

class Polybench_Gesummv {
public:
	Polybench_Gesummv(const BenchmarkArgs& args) : args(args), size(args.problem_size) {}

	void setup() {
		A.resize(size * size);
		B.resize(size * size);
		x.resize(size);
		y.resize(size);
		tmp.resize(size);

		init(A.data(), B.data(), x.data(), size);

		//2
		auto SIZE = size*size;
		A_usm = malloc_device<DATA_TYPE>(SIZE,args.device_queue);
		args.device_queue.submit([&](cl::sycl::handler& h){
            auto out_a = A_usm;
            auto in_a = &A[0];
            h.parallel_for(SIZE,[=](cl::sycl::id<1> i){
              out_a[i] = in_a[i];
            });
        }).wait();

		B_usm = malloc_device<DATA_TYPE>(SIZE,args.device_queue);
        args.device_queue.submit([&](cl::sycl::handler& h){
            auto out_b = B_usm;
            auto in_b = &B[0];
            h.parallel_for(SIZE,[=](cl::sycl::id<1> i){
              out_b[i] = in_b[i];
            });
        }).wait();

		//1
		X_usm = malloc_device<DATA_TYPE>(size,args.device_queue);
        args.device_queue.submit([&](cl::sycl::handler& h){
            auto out_x = X_usm;
            auto in_x = &x[0];
            h.parallel_for(size,[=](cl::sycl::id<1> i){
              out_x[i] = in_x[i];
            });
        }).wait();

		Y_usm = malloc_device<DATA_TYPE>(size,args.device_queue);
		args.device_queue.submit([&](cl::sycl::handler& h){
            auto out_y = Y_usm;
            h.parallel_for(size,[=](cl::sycl::id<1> i){
              out_y[i] = 0.0;
            });
        }).wait();

		TMP_usm = malloc_device<DATA_TYPE>(size,args.device_queue);
		args.device_queue.submit([&](cl::sycl::handler& h){
            auto out_tmp = TMP_usm;
            h.parallel_for(size,[=](cl::sycl::id<1> i){
              out_tmp[i] = 0.0;
            });
        }).wait();

	// 	A_buffer.initialize(args.device_queue, A.data(), cl::sycl::range<2>(size, size));
	// 	B_buffer.initialize(args.device_queue, B.data(), cl::sycl::range<2>(size, size));
	// 	x_buffer.initialize(args.device_queue, x.data(), cl::sycl::range<1>(size));
	// 	y_buffer.initialize(args.device_queue, y.data(), cl::sycl::range<1>(size));
	// 	tmp_buffer.initialize(args.device_queue, tmp.data(), cl::sycl::range<1>(size));
	}

	void run(std::vector<cl::sycl::event>& events) {
		using namespace cl::sycl;

		auto a_usm = A_usm;
		auto b_usm = B_usm;
		auto x_usm = X_usm;
		auto y_usm = Y_usm;
		auto tmp_usm = TMP_usm;

		events.push_back(args.device_queue.submit([&](handler& cgh) {
			// auto A = A_buffer.get_access<access::mode::read>(cgh);
			// auto B = B_buffer.get_access<access::mode::read>(cgh);
			// auto x = x_buffer.get_access<access::mode::read>(cgh);
			// auto y = y_buffer.get_access<access::mode::read_write>(cgh);
			// auto tmp = tmp_buffer.get_access<access::mode::read_write>(cgh);

			cgh.parallel_for<Gesummv>(size, [=, N_ = size](item<1> item) {
				size_t i = item[0];

				for(size_t j = 0; j < N_; j++) {
					tmp_usm[item] += a_usm[i*N_+j] * x_usm[j];
				}

				for(size_t j = 0; j<N_;j++){
					y_usm[item] += b_usm[i*N_+j] * x_usm[j];
				}

				y_usm[item] = ALPHA * tmp_usm[item] + BETA * y_usm[item];
			});
		}));
	}

	bool verify(VerificationSetting&) {
		constexpr auto ERROR_THRESHOLD = 0.05;

		// Trigger writeback
		//y_buffer.reset();

		std::vector<DATA_TYPE> y_cpu(size);
		std::vector<DATA_TYPE> tmp_cpu(size);

		gesummv(A.data(), B.data(), x.data(), y_cpu.data(), tmp_cpu.data(), size);

		bool flag = true;

		for(size_t i = 0; i < size; i++) {
			const auto diff = percentDiff(y_cpu[i], Y_usm[i]);
			if(diff > ERROR_THRESHOLD)
			{
				flag=false;
				break;
			}
		}
		free(A_usm,args.device_queue);
		free(B_usm,args.device_queue);
		free(X_usm,args.device_queue);
		free(Y_usm,args.device_queue);
		free(TMP_usm,args.device_queue);

		return flag;
	}

	static std::string getBenchmarkName() { return "Polybench_Gesummv"; }

private:
	BenchmarkArgs args;

	const size_t size;
	std::vector<DATA_TYPE> A;
	std::vector<DATA_TYPE> B;
	std::vector<DATA_TYPE> x;
	std::vector<DATA_TYPE> y;
	std::vector<DATA_TYPE> tmp;

	DATA_TYPE *A_usm;
	DATA_TYPE *B_usm;
	DATA_TYPE *X_usm;
	DATA_TYPE *Y_usm;
	DATA_TYPE *TMP_usm;

	// PrefetchedBuffer<DATA_TYPE, 2> A_buffer;
	// PrefetchedBuffer<DATA_TYPE, 2> B_buffer;
	// PrefetchedBuffer<DATA_TYPE, 1> x_buffer;
	// PrefetchedBuffer<DATA_TYPE, 1> y_buffer;
	// PrefetchedBuffer<DATA_TYPE, 1> tmp_buffer;
};

int main(int argc, char** argv) {
	BenchmarkApp app(argc, argv);
	app.run<Polybench_Gesummv>();
	return 0;
}
