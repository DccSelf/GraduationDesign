// 程序的性能指标：两个缓存区之间（1维、2维、3维）复制单精度和双精度浮点值来测量可实现的设备内存带宽，
// 由于可以测2和3维缓存区的性能，从而可以间接量化给定SYCL实现将高维索引映射到底层硬件的效率

// clang++ -fsycl  -O3 -I/thfs1/home/penglin/dcc/sycl-bench/include -DSYCL_BENCH_ENABLE_QUEUE_PROFILING  Traid.cpp -o Traid
// clang++ -fsycl -O3 -S -emit-llvm Traid.cpp -o Traid.ll
// clang++ -fsycl -O3 -c -emit-llvm Traid.cpp -o Traid.bc


// valgrind --tool=massif --time-unit=ms --max-snapshots=1000 --detailed-freq=1 --pages-as-heap=yes ./Traid-single_task --size=1024 --num-runs=1


#include "common.h"

namespace s = cl::sycl;

template <typename DataT, int Dims>
class MicroBenchTraidKernel1;


template <typename DataT, int Dims>
class MicroBenchTraidKernel2;


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
 * Microbenchmark measuring Traid bandwidth.
 */
template <typename DataT, int Dims>
class MicroBenchTraid {
protected:
//   BenchmarkArgs args;
//   const s::range<Dims> buffer_size;
//   // Since we cannot use explicit memory operations to initialize the input buffer,
//   // we have to keep this around, unfortunately.
//   std::vector<DataT> input;
//   PrefetchedBuffer<DataT, Dims> input_buf;
//   PrefetchedBuffer<DataT, Dims> output_buf;

  //USM
  BenchmarkArgs args;
  std::vector<DataT> input;
  
  int USM_size;
  DataT *input_usm;
  DataT *output_usm;


public:
  MicroBenchTraid(const BenchmarkArgs& args):args(args),USM_size(getBufferSize<DataT, Dims>(args.problem_size).size())
  {
        input.resize(USM_size,33.f);
  }

  void setup() {
    // input_buf.initialize(args.device_queue, input.data(), buffer_size);
    // output_buf.initialize(args.device_queue, buffer_size);

    input_usm = malloc_device<DataT>(USM_size,args.device_queue);
    //copy host_data:input to device
    //初始化 热启动 性能相比直接使用USM提升一倍
    args.device_queue.submit([&](cl::sycl::handler& h){
            //h.memcpy(input_usm, &input[0], USM_size*sizeof(DataT));
            auto in_d = input_usm;
            auto in_h = &input[0];
            h.single_task([=,N=USM_size](){
              for(size_t i=0;i<N;i++)
              {
                in_d[i] = in_h[i];
              }
            });
    }).wait();
        
    output_usm = malloc_device<DataT>(USM_size,args.device_queue);
    args.device_queue.submit([&](cl::sycl::handler& h){
            //h.memcpy(input_usm, &input[0], USM_size*sizeof(DataT));
            auto in_d = output_usm;
            h.single_task([=,N=USM_size](){
              for(size_t i=0;i<N;i++)
              {
                in_d[i] = 0.0;
              }
            });
    }).wait();
    
  }

  static ThroughputMetric getThroughputMetric(const BenchmarkArgs& args) {
    const double copiedGiB =
        getBufferSize<DataT, Dims>(args.problem_size).size() * sizeof(DataT) / 1024.0 / 1024.0 / 1024.0;
    // Multiply by two as we are both reading and writing one element in each thread.
    return {copiedGiB * 3.0, "GiB"};
  }

  void run(std::vector<s::event>& events) {

    
    auto in1 = input_usm;
    auto in2 = input_usm;
    auto out = output_usm;
    DataT scalar = 3.0;
    events.push_back(args.device_queue.single_task([=,N =USM_size](){
      for(size_t i=0;i<N;i++)
      {
        out[i] = in1[i] + scalar * in2[i];
      }
    }));
      
  }


  bool verify(VerificationSetting& ver) {
    bool flag = true;
    for(size_t i = 0; i < USM_size; ++i) {
      if(output_usm[i]!=132.f)
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
    name << "MicroBench_Traid_";
    name << ReadableTypename<DataT>::name;
    name << "_" << Dims;
    return name.str();
  }
};

int main(int argc, char** argv) {
  BenchmarkApp app(argc, argv);

  app.run<MicroBenchTraid<float, 1>>();
//   app.run<MicroBenchTraid<float, 2>>();
//   app.run<MicroBenchTraid<float, 3>>();
//   if(app.deviceSupportsFP64()) {
//     app.run<MicroBenchTraid<double, 1>>();
//     app.run<MicroBenchTraid<double, 2>>();
//     app.run<MicroBenchTraid<double, 3>>();
//   }

  return 0;
}

