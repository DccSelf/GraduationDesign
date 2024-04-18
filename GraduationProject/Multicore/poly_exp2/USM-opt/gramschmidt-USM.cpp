#include <string>
#include <vector>

#include <cmath>
#include <cstdlib>

#include <CL/sycl.hpp>

#include "common.h"
#include "polybenchUtilFuncts.h"

using DATA_TYPE = float;

class Gramschmidt1;
class Gramschmidt2;
class Gramschmidt3;

void init_array(DATA_TYPE* A, size_t size) {
	const auto M = size;
	const auto N = size;

	for(size_t i = 0; i < M; i++) {
		for(size_t j = 0; j < N; j++) {
			A[i * N + j] = ((DATA_TYPE)(i + 1) * (j + 1)) / (M + 1);
		}
	}
}

void gramschmidt(DATA_TYPE* A, DATA_TYPE* R, DATA_TYPE* Q, size_t size) {
	const auto M = size;
	const auto N = size;

	for(size_t k = 0; k < N; k++) {
		DATA_TYPE nrm = 0;
		for(size_t i = 0; i < M; i++) {
			nrm += A[i * N + k] * A[i * N + k];
		}

		R[k * N + k] = sqrt(nrm);
		for(size_t i = 0; i < M; i++) {
			Q[i * N + k] = A[i * N + k] / R[k * N + k];
		}

		for(size_t j = k + 1; j < N; j++) {
			R[k * N + j] = 0;
			for(size_t i = 0; i < M; i++) {
				R[k * N + j] += Q[i * N + k] * A[i * N + j];
			}
			for(size_t i = 0; i < M; i++) {
				A[i * N + j] = A[i * N + j] - Q[i * N + k] * R[k * N + j];
			}
		}
	}
}

class Polybench_Gramschmidt {
  public:
	Polybench_Gramschmidt(const BenchmarkArgs& args) : args(args), USM_size(args.problem_size) {}

	void setup() {
		A.resize(USM_size * USM_size);
		R.resize(USM_size * USM_size);
		Q.resize(USM_size * USM_size);

		init_array(A.data(), USM_size);

        auto SIZE = USM_size * USM_size;
        A_usm = malloc_device<DATA_TYPE>(SIZE,args.device_queue);
        args.device_queue.submit([&](cl::sycl::handler& h){
            auto in_d = A_usm;
            auto in_h = &A[0];
            h.parallel_for(SIZE,[=](cl::sycl::id<1> i){
              in_d[i] = in_h[i];
            });
        }).wait();
        
        R_usm = malloc_device<DATA_TYPE>(SIZE,args.device_queue);
        args.device_queue.submit([&](cl::sycl::handler& h){
            //h.memcpy(input_usm, &input[0], USM_size*sizeof(DataT));
            auto in_d = R_usm;
            h.parallel_for(SIZE,[=](cl::sycl::id<1> i){
              in_d[i] = 0.0;
            });
        }).wait();

        Q_usm = malloc_device<DATA_TYPE>(SIZE,args.device_queue);
        args.device_queue.submit([&](cl::sycl::handler& h){
            //h.memcpy(input_usm, &input[0], USM_size*sizeof(DataT));
            auto in_d = Q_usm;
            h.parallel_for(SIZE,[=](cl::sycl::id<1> i){
              in_d[i] = 0.0;
            });
        }).wait();


		// A_buffer.initialize(args.device_queue, A.data(), cl::sycl::range<2>(size, size));
		// R_buffer.initialize(args.device_queue, R.data(), cl::sycl::range<2>(size, size));
		// Q_buffer.initialize(args.device_queue, Q.data(), cl::sycl::range<2>(size, size));
	}

    void run(std::vector<cl::sycl::event>& events) {
        using namespace cl::sycl;

        auto a_usm = A_usm;
        auto r_usm = R_usm;
        auto q_usm = Q_usm;

        events.push_back(args.device_queue.submit([&](handler& cgh) {
				cgh.parallel_for<Gramschmidt1>(range<2>(USM_size, USM_size), [=, M_ = USM_size](item<2> item) {
                    size_t k = item[0];
                    size_t j = item[1];

					DATA_TYPE nrm = 0;
					for(size_t i = 0; i < M_; i++) {
						nrm += a_usm[i*M_+k] * a_usm[i*M_+k];
					}
					r_usm[k*M_+k] = cl::sycl::sqrt(nrm);


                    for(size_t i=0;i<M_;i++)
                    {
                        q_usm[i*M_+k] = a_usm[i*M_+k] / r_usm[k*M_+k]; 
                    }

                    if(j <= k || j >= M_) return;
					r_usm[k*M_+j] = 0;
					for(size_t i = 0; i < M_; i++) {
						r_usm[k*M_+j] += q_usm[i*M_+k] * a_usm[i*M_+j];
					}
					for(size_t i = 0; i < M_; i++) {
						a_usm[i*M_+j] -= q_usm[i*M_+k] * r_usm[k*M_+j];
					}

				});
		}));
    }

	// void run(std::vector<cl::sycl::event>& events) {
	// 	using namespace cl::sycl;

    //     auto a_usm = A_usm;
    //     auto r_usm = R_usm;
    //     auto q_usm = Q_usm;

	// 	for(size_t k = 0; k < USM_size; k++) {
	// 		events.push_back(args.device_queue.submit([&](handler& cgh) {
	// 			// auto A = A_buffer.get_access<access::mode::read>(cgh);
	// 			// auto R = R_buffer.get_access<access::mode::write>(cgh);
	// 			cgh.parallel_for<Gramschmidt1>(range<2>(1, 1), [=, M_ = USM_size](item<2> item) {
	// 				DATA_TYPE nrm = 0;
	// 				for(size_t i = 0; i < M_; i++) {
	// 					nrm += a_usm[i*M_+k] * a_usm[i*M_+k];
	// 				}
	// 				r_usm[k*M_+k] = cl::sycl::sqrt(nrm);
	// 			});
	// 		}));

	// 		events.push_back(args.device_queue.submit([&](handler& cgh) {
	// 			// auto A = A_buffer.get_access<access::mode::read>(cgh);
	// 			// auto R = R_buffer.get_access<access::mode::read>(cgh);
	// 			// auto Q = Q_buffer.get_access<access::mode::write>(cgh);
	// 			cgh.parallel_for<Gramschmidt2>(range<2>(USM_size, 1), id<2>(0, k), [=,M_=USM_size](item<2> item) {
    //                 size_t i = item[0];
                    
    //                 q_usm[i*M_+k] = a_usm[i*M_+k] / r_usm[k*M_+k]; 
    //             });
	// 		}));

	// 		events.push_back(args.device_queue.submit([&](handler& cgh) {
	// 			// auto A = A_buffer.get_access<access::mode::read_write>(cgh);
	// 			// auto R = R_buffer.get_access<access::mode::write>(cgh);
	// 			// auto Q = Q_buffer.get_access<access::mode::read>(cgh);

	// 			cgh.parallel_for<Gramschmidt3>(range<2>(USM_size, 1), [=, M_ = USM_size, N_ = USM_size](item<2> item) {
	// 				size_t j = item[0];

	// 				if(j <= k || j >= N_) return;

	// 				r_usm[k*M_+j] = 0;
	// 				for(size_t i = 0; i < M_; i++) {
	// 					r_usm[k*M_+j] += q_usm[i*M_+k] * a_usm[i*M_+j];
	// 				}

	// 				for(size_t i = 0; i < M_; i++) {
	// 					a_usm[i*M_+j] -= q_usm[i*M_+k] * r_usm[k*M_+j];
	// 				}
	// 			});
	// 		}));
	// 	}
	// }

	bool verify(VerificationSetting&) {
		constexpr auto ERROR_THRESHOLD = 0.05;

		std::vector<DATA_TYPE> A_cpu(USM_size * USM_size);
		std::vector<DATA_TYPE> R_cpu(USM_size * USM_size);
		std::vector<DATA_TYPE> Q_cpu(USM_size * USM_size);

        bool flag=true;
		// // Trigger writeback
		// A_buffer.reset();

		init_array(A_cpu.data(), USM_size);

		gramschmidt(A_cpu.data(), R_cpu.data(), Q_cpu.data(), USM_size);

		for(size_t i = 0; i < USM_size; i++) {
			for(size_t j = 0; j < USM_size; j++) {
				const auto diff = percentDiff(A_cpu[i * USM_size + j], A_usm[i * USM_size + j]);
				if(diff > ERROR_THRESHOLD)
                {
                    flag=false;
                    break;
                }
			}
		}

        free(A_usm,args.device_queue);
        free(R_usm,args.device_queue);
        free(Q_usm,args.device_queue);

		return flag;
	}

	static std::string getBenchmarkName() { return "Polybench_Gramschmidt"; }

  private:
	// BenchmarkArgs args;

	// const size_t size;
	// std::vector<DATA_TYPE> A;
	// std::vector<DATA_TYPE> R;
	// std::vector<DATA_TYPE> Q;

	// PrefetchedBuffer<DATA_TYPE, 2> A_buffer;
	// PrefetchedBuffer<DATA_TYPE, 2> R_buffer;
	// PrefetchedBuffer<DATA_TYPE, 2> Q_buffer;

    BenchmarkArgs args;
    std::vector<DATA_TYPE> A;
    std::vector<DATA_TYPE> R;
    std::vector<DATA_TYPE> Q;
  
    size_t USM_size;
    DATA_TYPE *A_usm;
    DATA_TYPE *R_usm;
    DATA_TYPE *Q_usm;
};

int main(int argc, char** argv) {
	BenchmarkApp app(argc, argv);
	app.run<Polybench_Gramschmidt>();
	return 0;
}
