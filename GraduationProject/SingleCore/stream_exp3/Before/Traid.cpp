#include "common.h"

namespace s = cl::sycl;

template <typename DataT, int Dims>
class MicroBenchTraidKernel;

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
  BenchmarkArgs args;
  const s::range<Dims> buffer_size;
  // Since we cannot use explicit memory operations to initialize the input buffer,
  // we have to keep this around, unfortunately.
  std::vector<DataT> input;
  PrefetchedBuffer<DataT, Dims> input_buf;
  PrefetchedBuffer<DataT, Dims> output_buf;

public:
  MicroBenchTraid(const BenchmarkArgs& args)
      : args(args), buffer_size(getBufferSize<DataT, Dims>(args.problem_size)), input(buffer_size.size(), 33.f) {}

  void setup() {
    input_buf.initialize(args.device_queue, input.data(), buffer_size);
    output_buf.initialize(args.device_queue, buffer_size);
  }

  static ThroughputMetric getThroughputMetric(const BenchmarkArgs& args) {
    const double copiedGiB =
        getBufferSize<DataT, Dims>(args.problem_size).size() * sizeof(DataT) / 1024.0 / 1024.0 / 1024.0;
    // Multiply by two as we are both reading and writing one element in each thread.
    return {copiedGiB * 3.0, "GiB"};
  }

  void run(std::vector<s::event>& events) {
    events.push_back(args.device_queue.submit([&](cl::sycl::handler& cgh) {
      auto in1 = input_buf.template get_access<s::access::mode::read>(cgh);
      auto in2 = input_buf.template get_access<s::access::mode::read>(cgh);
      auto out = output_buf.template get_access<s::access::mode::discard_write>(cgh);
      // We spawn one work item for each buffer element to be copied.
      const s::range<Dims> global_size{buffer_size};
      DataT scalar = 3.0;
      cgh.parallel_for<MicroBenchTraidKernel<DataT, Dims>>(
          global_size, [=](s::id<Dims> gid) { out[gid] = in1[gid] + scalar * in2[gid]; });
    }));
  }

  bool verify(VerificationSetting& ver) {
    auto result = output_buf.template get_access<s::access::mode::read>();
    for(size_t i = 0; i < buffer_size[0]; ++i) {
      for(size_t j = 0; j < (Dims < 2 ? 1 : buffer_size[1]); ++j) {
        for(size_t k = 0; k < (Dims < 3 ? 1 : buffer_size[2]); ++k) {
          if constexpr(Dims == 1) {
            if(result[i] != 132.f) {
              return false;
            }
          }
          if constexpr(Dims == 2) {
            if(result[{i, j}] != 132.f) {
              return false;
            }
          }
          if constexpr(Dims == 3) {
            if(result[{i, j, k}] != 132.f) {
              return false;
            }
          }
        }
      }
    }
    return true;
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
  // app.run<MicroBenchTraid<float, 2>>();
  // app.run<MicroBenchTraid<float, 3>>();
  // if(app.deviceSupportsFP64()) {
  //   app.run<MicroBenchTraid<double, 1>>();
  //   app.run<MicroBenchTraid<double, 2>>();
  //   app.run<MicroBenchTraid<double, 3>>();
  // }

  return 0;
}

