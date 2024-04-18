#include "common.h"

namespace s = cl::sycl;

template <typename DataT, int Dims>
class MicroBenchDRAMKernel;

template <typename DataT, int Dims>
class CopyBufferDummyKernel;

template <typename DataT, int Dims>
s::range<Dims> getBufferSize(size_t problemSize) {
  if constexpr(Dims == 1) {
    return s::range<1>(problemSize * problemSize * problemSize / sizeof(DataT));
  }
  if constexpr(Dims == 2) {
    return s::range<2>(problemSize * problemSize / sizeof(DataT), problemSize);
  }
  if constexpr(Dims == 3) {
    return s::range<3>(problemSize / sizeof(DataT), problemSize, problemSize);
  }
}

/**
 * Microbenchmark measuring DRAM bandwidth.
 */
template <typename DataT, int Dims>
class MicroBenchDRAM {
protected:
  //USM
  BenchmarkArgs args;
  std::vector<DataT> input;
  
  int USM_size;
  DataT *input_usm;
  DataT *output_usm;

public:
  MicroBenchDRAM(const BenchmarkArgs& args):args(args),USM_size(getBufferSize<DataT, Dims>(args.problem_size).size())
  {
        input.resize(USM_size,33.f);
  }

  void setup() {
        //usm
        input_usm = malloc_device<DataT>(USM_size,args.device_queue);
        //copy host_data:input to device
        //并行初始化 热启动 可以大大提高性能
        args.device_queue.submit([&](cl::sycl::handler& h){
            //h.memcpy(input_usm, &input[0], USM_size*sizeof(DataT));
            auto in_d = input_usm;
            auto in_h = &input[0];
            h.parallel_for(USM_size,[=,N=USM_size](s::id<1> i){
              in_d[i] = in_h[i];
            });
        }).wait();
        
        output_usm = malloc_device<DataT>(USM_size,args.device_queue);
        args.device_queue.submit([&](cl::sycl::handler& h){
            //h.memcpy(input_usm, &input[0], USM_size*sizeof(DataT));
            auto in_d = output_usm;
            h.parallel_for(USM_size,[=,N=USM_size](s::id<1> i){
              in_d[i] = 0.0;
            });
        }).wait();
   }

  static ThroughputMetric getThroughputMetric(const BenchmarkArgs& args) {
    const double copiedGiB =
        getBufferSize<DataT, Dims>(args.problem_size).size() * sizeof(DataT) / 1024.0 / 1024.0 / 1024.0;
    // Multiply by two as we are both reading and writing one element in each thread.
    return {copiedGiB * 2.0, "GiB"};
  }

  void run(std::vector<s::event>& events) {

    auto in = input_usm;
    auto out = output_usm;

    events.push_back(args.device_queue.submit([&](cl::sycl::handler& cgh) {
      // We spawn one work item for each buffer element to be copied.
      cgh.parallel_for<MicroBenchDRAMKernel<DataT, Dims>>(USM_size, [=](s::id<Dims> gid) { out[gid] = in[gid]; });
    }));
  }

  bool verify(VerificationSetting& ver) {
    bool flag = true;
    for(size_t i = 0; i < USM_size; ++i) {
      if(output_usm[i]!=33.f)
      {
        flag = false;
        break;
      }
    }

    free(input_usm,args.device_queue);
    free(output_usm,args.device_queue);

    return flag;
  }

  static std::string getBenchmarkName() {
    std::stringstream name;
    name << "MicroBench_DRAM_";
    name << ReadableTypename<DataT>::name;
    name << "_" << Dims;
    return name.str();
  }
};

int main(int argc, char** argv) {
  BenchmarkApp app(argc, argv);

  app.run<MicroBenchDRAM<float, 1>>();
  return 0;
}
