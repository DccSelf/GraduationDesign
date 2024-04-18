### 参考 实验.pdf

项目使用到的三个基准测试套件
1. SYCL-Bench
2. PolyBenchC-4.2.1
3. STREAM benchmark

SYCL性能评估和优化的数据和代码在GraduationDesign目录中
GraduationDesign/Multicore 多核实验部分
GraduationDesign/Multicore/dag_exp1 SYCL实现的调度开销和所使用后端的开销
GraduationDesign/Multicore/poly_exp2 SYCL吞吐量
GraduationDesign/Multicore/stream_exp3 SYCL带宽
GraduationDesign/Multicore/barrier NDRange使用显式barrier执行情况

GraduationDesign/singlecore 单核实验部分

C吞吐量评估 /BenchC/PolyBenchC-4.2.1
/BenchC/PolyBenchC-4.2.1/Test gcc -O3
/BenchC/PolyBenchC-4.2.1/Test-fopenmp gcc -O3 -fopenmp
编译方法：gcc -O0 -I utilities -I linear-algebra/kernels/atax utilities/polybench.c linear-algebra/kernels/atax/atax.c -DPOLYBENCH_DUMP_ARRAYS -o atax_ref

C带宽评估 /BenchC/STREAMbenchmark
/BenchC/STREAMbenchmark/stream_c   gcc -O3
/BenchC/STREAMbenchmark/stream_c_fopenmp  gcc -O3 -fopenmp （线程绑核也执行这个文件即可 ./stream_c_fopenmp）
编译方法：gcc -O3 -fopenmp stream.c -o stream_c_fopenmp

线程绑核需要提前设置的环境变量

