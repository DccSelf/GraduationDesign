### 参考 实验.pdf

#### 项目使用到的三个基准测试套件
1. SYCL-Bench  https://github.com/unisa-hpc/sycl-bench  //SYCL吞吐量+带宽+调度开销
2. PolyBenchC-4.2.1  https://github.com/MatthiasJReisinger/PolyBenchC-4.2.1     //C吞吐量
3. STREAM benchmark  https://github.com/jeffhammond/STREAM   //C带宽

#### SYCL性能评估和优化的数据和代码在GraduationDesign目录中
GraduationDesign/Multicore 多核实验部分

GraduationDesign/Multicore/dag_exp1 SYCL实现的调度开销和所使用后端的开销

GraduationDesign/Multicore/poly_exp2 SYCL吞吐量

GraduationDesign/Multicore/stream_exp3 SYCL带宽

GraduationDesign/Multicore/barrier NDRange使用显式barrier执行情况

GraduationDesign/singlecore 单核实验部分

GraduationDesign/singlecore/dag_exp1 SYCL实现的调度开销和所使用后端的开销

GraduationDesign/singlecore/poly_exp2 SYCL吞吐量

GraduationDesign/singlecore/stream_exp3 SYCL带宽

GraduationDesign/singlecore/barrier NDRange使用显式barrier执行情况

编译方法：clang++ -fsycl -O3 sycl-bench/include sycl-bench/polybench/common -DSYCL_BENCH_ENABLE_QUEUE_PROFILING gemm.cpp -o gemm

#### C吞吐量评估 /BenchC/PolyBenchC-4.2.1
/BenchC/PolyBenchC-4.2.1/Test gcc -O3
/BenchC/PolyBenchC-4.2.1/Test-fopenmp gcc -O3 -fopenmp

编译方法：
cd Test
gcc -O3 -I ../utilities -I ../linear-algebra/kernels/atax ../utilities/polybench.c ../linear-algebra/kernels/atax/atax.c -DPOLYBENCH_DUMP_ARRAYS -o atax_ref

#### C带宽评估 /BenchC/STREAMbenchmark
/BenchC/STREAMbenchmark/stream_c   gcc -O3
/BenchC/STREAMbenchmark/stream_c_fopenmp  gcc -O3 -fopenmp （线程绑核也执行这个文件即可 ./stream_c_fopenmp）

编译方法：gcc -O3 -fopenmp stream.c -o stream_c_fopenmp

#### 线程绑核需要提前设置的环境变量
##### OpenMP 
export GOMP_CPU_AFFINITY="0-63"
export OMP_PROC_BIND="true"
export OMP_PLACES=cores

yhrun -N 1 -n 1 -c 64 -p thcp1 ./gemm_fopenmp

##### POCL
export POCL_AFFINITY=1

yhrun -N 1 -n 1 -c 64 -p thcp1 ./gemm --size=1024 --num-runs=3




