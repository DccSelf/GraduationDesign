#include "common.h"

namespace s = cl::sycl;

template <typename DataT, int Iterations>
class MicroBenchArithmeticKernel;

/**
 * Microbenchmark stressing the main arithmetic units.
 */
template <typename DataT, int Iterations = 512>
class MicroBenchArithmetic {
protected:
  std::vector<DataT> input;
  BenchmarkArgs args;

  PrefetchedBuffer<DataT, 1> input_buf;
  PrefetchedBuffer<DataT, 1> output_buf;

public:
  MicroBenchArithmetic(const BenchmarkArgs& _args) : args(_args) {}

  void setup() { // 初始化数据
    input.resize(args.problem_size, DataT{1});

    input_buf.initialize(args.device_queue, input.data(), s::range<1>(args.problem_size));
    output_buf.initialize(args.device_queue, s::range<1>(args.problem_size));
  }

  static ThroughputMetric getThroughputMetric(const BenchmarkArgs& args) { // 静态函数返回基准测试的吞吐量指标
    if constexpr(std::is_same_v<DataT, float>) {
      // Multiply everything times two as we are doing FMAs.
      const double FLOP = args.problem_size * Iterations * 2 * 2;
      return {FLOP / 1024.0 / 1024.0 / 1024.0, "SP GFLOP"};
    }
    if constexpr(std::is_same_v<DataT, double>) {
      // Multiply everything times two as we are doing FMAs.
      const double DFLOP = args.problem_size * Iterations * 2 * 2;
      return {DFLOP / 1024.0 / 1024.0 / 1024.0, "DP GFLOP"};
    }
    if constexpr(std::is_same_v<DataT, int>) {
      // Multiply everything times two as we are doing MAD.
      const double OP = args.problem_size * Iterations * 2 * 2;
      return {OP / 1024.0 / 1024.0 / 1024.0, "GOP"};
    }
    return {};
  }

  void run(std::vector<cl::sycl::event>& events) { // 执行基准测试
    events.push_back(args.device_queue.submit([&](cl::sycl::handler& cgh) {
      auto in = input_buf.template get_access<s::access::mode::read>(cgh);
      auto out = output_buf.template get_access<s::access::mode::discard_write>(cgh);

      cgh.parallel_for<MicroBenchArithmeticKernel<DataT, Iterations>>(
          s::range<1>{args.problem_size}, [=](cl::sycl::id<1> gid) {
            DataT a1 = in[gid];
            // Unroll the loop and use local memory
            for(int i = 0; i < 256; ++i) {
              // Use FMA (Fused Multiply-Add) operation
              a1 = fma(a1, a1, a1);
              a1 = fma(a1, a1, -a1);
              a1 = fma(a1, a1, a1);
              a1 = fma(a1, a1, -a1);
            }
            out[gid] = a1;
          });


      //   cgh.parallel_for<MicroBenchArithmeticKernel<DataT, Iterations>>(
      //       s::range<1>{args.problem_size}, [=](cl::sycl::id<1> gid) {
      //         DataT a1 = in[gid];
      //         const DataT a2 = a1;

      //         for(int i = 0; i < 512; ++i) {
      //           // We do two operations to ensure the value remains 1 and doesn't grow indefinitely.
      //           a1 = a1 * a1 + a1;
      //           a1 = a1 * a2 - a2;
      //         }

      //         out[gid] = a1;
      //       });
    }));
  }

  bool verify(VerificationSetting& ver) { // 验证基准测试结果
    auto result = output_buf.template get_access<s::access::mode::read>();
    for(size_t i = 0; i < args.problem_size; ++i) {
      if(result[i] != DataT{1}) {
        return false;
      }
    }
    return true;
  }

  static std::string getBenchmarkName() { // 静态函数返回基准测试的名称
    std::stringstream name;
    name << "MicroBench_Arith_";
    name << ReadableTypename<DataT>::name << "_";
    name << Iterations;
    return name.str();
  }
};

int main(int argc, char** argv) { // 这个程序旨在执行一些微基准测试，具体测试了不同数据类型的算术运算性能。
  BenchmarkApp app(argc, argv);

  app.run<MicroBenchArithmetic<int>>();
  app.run<MicroBenchArithmetic<float>>();
  if(app.deviceSupportsFP64())
    app.run<MicroBenchArithmetic<double>>();

  return 0;
}

