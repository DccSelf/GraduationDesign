#include <string>
#include <vector>

#include <cstdlib>

#include <CL/sycl.hpp>

#include "common.h"
#include "polybenchUtilFuncts.h"

using DATA_TYPE = float;

class Fdtd2d1;
class Fdtd2d2;
class Fdtd2d3;

size_t TMAX = 500;

void init_arrays(DATA_TYPE* fict, DATA_TYPE* ex, DATA_TYPE* ey, DATA_TYPE* hz, size_t size) {
	const auto NX = size;
	const auto NY = size;

	for(size_t i = 0; i < TMAX; i++) {
		fict[i] = (DATA_TYPE)i;
	}

	for(size_t i = 0; i < NX; i++) {
		for(size_t j = 0; j < NY; j++) {
			ex[i * NY + j] = ((DATA_TYPE)i * (j + 1) + 1) / NX;
			ey[i * NY + j] = ((DATA_TYPE)(i - 1) * (j + 2) + 2) / NX;
			hz[i * NY + j] = ((DATA_TYPE)(i - 9) * (j + 4) + 3) / NX;
		}
	}
}

void runFdtd(DATA_TYPE* fict, DATA_TYPE* ex, DATA_TYPE* ey, DATA_TYPE* hz, size_t size) {
	const auto NX = size;
	const auto NY = size;

	for(size_t t = 0; t < TMAX; t++) {
		for(size_t j = 0; j < NY; j++) {
			ey[0 * NY + j] = fict[t];
		}

		for(size_t i = 1; i < NX; i++) {
			for(size_t j = 0; j < NY; j++) {
				ey[i * NY + j] = ey[i * NY + j] - 0.5 * (hz[i * NY + j] - hz[(i - 1) * NY + j]);
			}
		}

		for(size_t i = 0; i < NX; i++) {
			for(size_t j = 1; j < NY; j++) {
				ex[i * (NY + 1) + j] = ex[i * (NY + 1) + j] - 0.5 * (hz[i * NY + j] - hz[i * NY + (j - 1)]);
			}
		}

		for(size_t i = 0; i < NX; i++) {
			for(size_t j = 0; j < NY; j++) {
				hz[i * NY + j] = hz[i * NY + j] - 0.7 * (ex[i * (NY + 1) + (j + 1)] - ex[i * (NY + 1) + j] + ey[(i + 1) * NY + j] - ey[i * NY + j]);
			}
		}
	}
}

class Polybench_Fdtd2d {
  public:
	Polybench_Fdtd2d(const BenchmarkArgs& args) : args(args), size(args.problem_size) {}

	void setup() {
		fict.resize(TMAX);
		ex.resize(size * (size + 1));
		ey.resize((size + 1) * size);
		hz.resize(size * size);

		init_arrays(fict.data(), ex.data(), ey.data(), hz.data(), size);

		auto SIZE = (size+1)*size;
        FICT_usm = malloc_shared<DATA_TYPE>(TMAX,args.device_queue);
        args.device_queue.submit([&](cl::sycl::handler& h){
            auto in_d = FICT_usm;
            auto in_h = &fict[0];
            h.parallel_for(TMAX,[=](cl::sycl::id<1> i){
              in_d[i] = in_h[i];
            });
        }).wait();

		EX_usm = malloc_shared<DATA_TYPE>(SIZE,args.device_queue);
        args.device_queue.submit([&](cl::sycl::handler& h){
            auto in_d = EX_usm;
            auto in_h = &ex[0];
            h.parallel_for(SIZE,[=](cl::sycl::id<1> i){
              in_d[i] = in_h[i];
            });
        }).wait();

		EY_usm = malloc_shared<DATA_TYPE>(SIZE,args.device_queue);
        args.device_queue.submit([&](cl::sycl::handler& h){
            auto in_d = EY_usm;
            auto in_h = &ey[0];
            h.parallel_for(SIZE,[=](cl::sycl::id<1> i){
              in_d[i] = in_h[i];
            });
        }).wait();

		HZ_usm = malloc_shared<DATA_TYPE>(size*size,args.device_queue);
		size_t N = size*size;
        args.device_queue.submit([&](cl::sycl::handler& h){
            auto in_d = HZ_usm;
            auto in_h = &hz[0];
            h.parallel_for(N,[=](cl::sycl::id<1> i){
              in_d[i] = in_h[i];
            });
        }).wait();s

		// fict_buffer.initialize(args.device_queue, fict.data(), cl::sycl::range<1>(TMAX));
		// ex_buffer.initialize(args.device_queue, ex.data(), cl::sycl::range<2>(size, size + 1));
		// ey_buffer.initialize(args.device_queue, ey.data(), cl::sycl::range<2>(size + 1, size));
		// hz_buffer.initialize(args.device_queue, hz.data(), cl::sycl::range<2>(size, size));
	}

	void run(std::vector<cl::sycl::event>& events) {
		using namespace cl::sycl;

		auto fict_usm = FICT_usm;
		auto ex_usm = EX_usm;
		auto ey_usm = EY_usm;
		auto hz_usm = HZ_usm;

		for(size_t t = 0; t < TMAX; t++) {
			events.push_back(args.device_queue.submit([&](handler& cgh) {

				cgh.parallel_for<Fdtd2d1>(range<2>(size, size), [=,N_=size](item<2> item) {
					const auto i = item[0];
					const auto j = item[1];

					if(i == 0) {
						ey_usm[i*N_+j] = fict_usm[t];
					} else {
						ey_usm[i*N_+j] = ey_usm[i*N_+j] - 0.5 * (hz_usm[i*N_+j] - hz_usm[(i - 1)*N_+j]);
					}
				});
			}));

			events.push_back(args.device_queue.submit([&](handler& cgh) {
				cgh.parallel_for<Fdtd2d2>(range<2>(size, size), [=, NX_ = size, NY_ = size](item<2> item) {
					const auto i = item[0];
					const auto j = item[1];

					if(j > 0) ex_usm[i*NX_+j] = ex_usm[i*NX_+j] - 0.5 * (hz_usm[i*NX_+j] - hz_usm[i+(j - 1)*NX_]);
				});
			}));

			events.push_back(args.device_queue.submit([&](handler& cgh) {
				cgh.parallel_for<Fdtd2d3>(range<2>(size,size), [=,N_=size](item<2> item) {
					const auto i = item[0];
					const auto j = item[1];

					hz_usm[i*N_+j] = hz_usm[i*N_+j] - 0.7 * (ex_usm[i+(j + 1)*N_] - ex_usm[i*N_+j] + ey_usm[(i + 1)*N_+j] - ey_usm[i*N_+j]);
				});
			}));
		}
	}

	bool verify(VerificationSetting&) {
		// Yes, this is threshold is used by polybench/CUDA/fdtd2d. Numbers in
		// this benchmark can get pretty large and regular floats don't provide
		// enough precision. This verification may fail on some problem sizes.
		constexpr auto ERROR_THRESHOLD = 100.05;

		std::vector<DATA_TYPE> fict_cpu(TMAX);
		std::vector<DATA_TYPE> ex_cpu(size * (size + 1));
		std::vector<DATA_TYPE> ey_cpu((size + 1) * size);
		std::vector<DATA_TYPE> hz_cpu(size * size);

		// Trigger writebacks
		//hz_buffer.reset();

		init_arrays(fict_cpu.data(), ex_cpu.data(), ey_cpu.data(), hz_cpu.data(), size);

		runFdtd(fict_cpu.data(), ex_cpu.data(), ey_cpu.data(), hz_cpu.data(), size);
		bool flag = true;
		for(size_t i = 0; i < size; i++) {
			for(size_t j = 0; j < size; j++) {
				const auto diff = percentDiff(hz_cpu[i * size + j], HZ_usm[i * size + j]);
				if(diff > ERROR_THRESHOLD) {
					printf("%ld %ld: %f %f %f\n", i, j, hz_cpu[i * size + j], HZ_usm[i * size + j], diff);
					flag = false;
					break;
				}
			}
		}
		free(FICT_usm,args.device_queue);
		free(EX_usm,args.device_queue);
		free(EY_usm,args.device_queue);
		free(HZ_usm,args.device_queue);
				
		return flag;
	}

	static std::string getBenchmarkName() { return "Polybench_Fdtd2d"; }

  private:
	BenchmarkArgs args;

	const size_t size;
	std::vector<DATA_TYPE> fict;
	std::vector<DATA_TYPE> ex;
	std::vector<DATA_TYPE> ey;
	std::vector<DATA_TYPE> hz;

	DATA_TYPE *FICT_usm;
	DATA_TYPE *EX_usm;
	DATA_TYPE *EY_usm;
	DATA_TYPE *HZ_usm;
	

	// PrefetchedBuffer<DATA_TYPE, 1> fict_buffer;
	// PrefetchedBuffer<DATA_TYPE, 2> ex_buffer;
	// PrefetchedBuffer<DATA_TYPE, 2> ey_buffer;
	// PrefetchedBuffer<DATA_TYPE, 2> hz_buffer;
};

int main(int argc, char** argv) {
	BenchmarkApp app(argc, argv);
        //if(app.deviceSupportsFP64())
        app.run<Polybench_Fdtd2d>();
        return 0;
}
