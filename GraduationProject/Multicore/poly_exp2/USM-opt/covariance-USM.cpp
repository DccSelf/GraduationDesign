#include <string>
#include <vector>

#include <cmath>
#include <cstdlib>

#include <CL/sycl.hpp>

#include "common.h"
#include "polybenchUtilFuncts.h"

using DATA_TYPE = float;

class CovarianceMean;
class CovarianceReduce;
class CovarianceCovar;

constexpr DATA_TYPE float_n = 3214212.01;

void init_arrays(DATA_TYPE* data, size_t size) {
	const auto M = size;
	const auto N = size;

	for(size_t i = 0; i < M; i++) {
		for(size_t j = 0; j < N; j++) {
			data[i * (N + 1) + j] = ((DATA_TYPE)i * j) / M;
		}
	}
}

void covariance(DATA_TYPE* data, DATA_TYPE* symmat, DATA_TYPE* mean, size_t size) {
	const auto M = size;
	const auto N = size;

	// Determine mean of column vectors of input data matrix
	for(size_t j = 1; j <= M; j++) {
		mean[j] = 0.0;
		for(size_t i = 1; i <= N; i++) {
			mean[j] += data[i * (M + 1) + j];
		}
		mean[j] /= float_n;
	}

	// Center the column vectors.
	for(size_t i = 1; i <= N; i++) {
		for(size_t j = 1; j <= M; j++) {
			data[i * (M + 1) + j] -= mean[j];
		}
	}

	// Calculate the m * m covariance matrix.
	for(size_t j1 = 1; j1 <= M; j1++) {
		for(size_t j2 = j1; j2 <= M; j2++) {
			symmat[j1 * (M + 1) + j2] = 0.0;
			for(size_t i = 1; i <= N; i++) {
				symmat[j1 * (M + 1) + j2] += data[i * (M + 1) + j1] * data[i * (M + 1) + j2];
			}
			symmat[j2 * (M + 1) + j1] = symmat[j1 * (M + 1) + j2];
		}
	}
}

class Polybench_Covariance {
public:
	Polybench_Covariance(const BenchmarkArgs& args) : args(args), size(args.problem_size) {}

	void setup() {
		data.resize((size + 1) * (size + 1));
		symmat.resize((size + 1) * (size + 1));
		mean.resize(size + 1);

		init_arrays(data.data(), size);

		auto SIZE = (size+1) * (size+1);
        data_usm = malloc_device<DATA_TYPE>(SIZE,args.device_queue);
        args.device_queue.submit([&](cl::sycl::handler& h){
            auto in_d = data_usm;
            auto in_h = &data[0];
            h.parallel_for(SIZE,[=](cl::sycl::id<1> i){
              in_d[i] = in_h[i];
            });
        }).wait();
        
        symmat_usm = malloc_device<DATA_TYPE>(SIZE,args.device_queue); //2
		args.device_queue.submit([&](cl::sycl::handler& h){
            auto in_d = symmat_usm;
            h.parallel_for(SIZE,[=](cl::sycl::id<1> i){
              in_d[i] = 0.0;
            });
        }).wait();

        mean_usm = malloc_device<DATA_TYPE>(size+1,args.device_queue); //1
		args.device_queue.submit([&](cl::sycl::handler& h){
            auto in_d = mean_usm;
            h.parallel_for(size+1,[=](cl::sycl::id<1> i){
              in_d[i] = 0.0;
            });
        }).wait();

		// data_buffer.initialize(args.device_queue, data.data(), cl::sycl::range<2>(size + 1, size + 1));
		// symmat_buffer.initialize(args.device_queue, symmat.data(), cl::sycl::range<2>(size + 1, size + 1));
		// mean_buffer.initialize(args.device_queue, mean.data(), cl::sycl::range<1>(size + 1));
  }

	void run(std::vector<cl::sycl::event>& events) {
		using namespace cl::sycl;

		auto data = data_usm;
		auto symmat = symmat_usm;
		auto symmat2 = symmat_usm;
		auto mean = mean_usm;

		events.push_back(args.device_queue.submit([&](handler& cgh) {
			// auto data = data_buffer.get_access<access::mode::read>(cgh);
			// auto mean = mean_buffer.get_access<access::mode::discard_write>(cgh);
			cgh.parallel_for<CovarianceMean>(range<1>(size), id<1>(1), [=, N_ = size](item<1> item) {
				size_t j = item[0];

				mean[item] = 0;
				for(size_t i = 1; i <= N_; i++) {
					mean[item] += data[i*(N_+1)+j];
				}

				mean[item] /= float_n;
			});
		}));

		events.push_back(args.device_queue.submit([&](handler& cgh) {
			// auto mean = mean_buffer.get_access<access::mode::read>(cgh);
			// auto data = data_buffer.get_access<access::mode::read_write>(cgh);

			cgh.parallel_for<CovarianceReduce>(range<2>(size, size), id<2>(1, 1), [=,N_=size](item<2> item) {
				size_t i = item[0];
				size_t j = item[1];
				//atomic_ref<DATA_TYPE,memory_order::relaxed,memory_scope::system,access::address_space::global_space> atomic_acc();
				data[i*(N_+1)+j] -= mean[j];
			});
		}));

		events.push_back(args.device_queue.submit([&](handler& cgh) {
			// auto data = data_buffer.get_access<access::mode::read>(cgh);
			// auto symmat = symmat_buffer.get_access<access::mode::discard_write>(cgh);
			// auto symmat2 = symmat_buffer.get_access<access::mode::discard_write>(cgh);

			cgh.parallel_for<CovarianceCovar>(range<1>(size), id<1>(1), [=, M_ = size, N_ = size](item<1> item) {
				size_t j1 = item[0];

				//symmat[{j1, j1}] = 1.0;

				for(size_t j2 = j1; j2 <= M_; j2++) {

					for(size_t i = 1; i <= N_; i++) {
						//atomic_ref<DATA_TYPE,memory_order::relaxed,memory_scope::system,access::address_space::global_space> atomic_acc();
						symmat[j1*(N_+1)+j2] += data[i*(N_+1)+j1] * data[i*(N_+1)+j2];
					}

					symmat2[j2*(N_+1)+j1] = symmat[j1*(N_+1)+j2];
				}
			});
		}));
	}

	bool verify(VerificationSetting&) {
		constexpr auto ERROR_THRESHOLD = 0.05;

		std::vector<DATA_TYPE> data_cpu((size + 1) * (size + 1));
		std::vector<DATA_TYPE> symmat_cpu((size + 1) * (size + 1));
		std::vector<DATA_TYPE> mean_cpu(size + 1);

		// Trigger writeback
		//symmat_buffer.reset();

		init_arrays(data_cpu.data(), size);

		covariance(data_cpu.data(), symmat_cpu.data(), mean_cpu.data(), size);
		
		bool flag = true;
		for(size_t i = 1; i < size + 1; i++) {
			for(size_t j = 1; j < size + 1; j++) {
				const auto diff = percentDiff(symmat_cpu[i * (size + 1) + j], symmat_usm[i * (size + 1) + j]);
				if(diff > ERROR_THRESHOLD)
				{
					printf("%ld %ld: %f %f %f\n", i, j, symmat_cpu[i * size + j], symmat_usm[i * size + j], diff);
					flag=false;
					break;
				}
			}
		}

		free(symmat_usm,args.device_queue);
        free(data_usm,args.device_queue);
        free(mean_usm,args.device_queue);
		return flag;
	}

	static std::string getBenchmarkName() { return "Polybench_Covariance"; }

private:
	BenchmarkArgs args;

	size_t size;
	std::vector<DATA_TYPE> data;
	std::vector<DATA_TYPE> symmat;
	std::vector<DATA_TYPE> mean;

	DATA_TYPE *data_usm;
	DATA_TYPE *symmat_usm;
	DATA_TYPE *mean_usm;

	// PrefetchedBuffer<DATA_TYPE, 2> data_buffer;
	// PrefetchedBuffer<DATA_TYPE, 2> symmat_buffer;
	// PrefetchedBuffer<DATA_TYPE, 1> mean_buffer;
};

int main(int argc, char** argv) {
	BenchmarkApp app(argc, argv);
	app.run<Polybench_Covariance>();
	return 0;
}
