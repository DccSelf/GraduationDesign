### 参考 实验.pdf

#### 项目使用到的三个基准测试套件
1. SYCL-Bench  https://github.com/unisa-hpc/sycl-bench  
//SYCL 内核调度开销及后端开销、内存带宽、吞吐量
2. PolyBenchC-4.2.1  https://github.com/MatthiasJReisinger/PolyBenchC-4.2.1     
//C 吞吐量  注：SYCL-Bench/Polybench改编自PolybenchC-4.2.1
3. STREAM benchmark  https://github.com/jeffhammond/STREAM   
//C 带宽


#### SYCL性能评估和优化的数据和代码在GraduationDesign目录中
###### GraduationDesign/Multicore 多核实验部分

GraduationDesign/Multicore/dag_exp1 SYCL实现的调度开销和后端的开销

GraduationDesign/Multicore/poly_exp2 SYCL吞吐量

GraduationDesign/Multicore/stream_exp3 SYCL带宽

// GraduationDesign/Multicore/barrier NDRange使用显式barrier执行情况 

编译方法：clang++ -fsycl -O3 sycl-bench/include sycl-bench/polybench/common -DSYCL_BENCH_ENABLE_QUEUE_PROFILING gemm.cpp -o gemm

###### GraduationDesign/singlecore 单核实验部分

GraduationDesign/singlecore/dag_exp1 SYCL实现的调度开销和所使用后端的开销

GraduationDesign/singlecore/poly_exp2 SYCL吞吐量

GraduationDesign/singlecore/stream_exp3 SYCL带宽

// GraduationDesign/singlecore/barrier NDRange使用显式barrier执行情况
// SYCL单核实现时主机设备不支持显示barrier
// 该实验用于证明并行循环分裂+并行循环交换可克服显示barrier

编译方法：clang++ -fsycl -O3 sycl-bench/include sycl-bench/polybench/common -DSYCL_BENCH_ENABLE_QUEUE_PROFILING gemm.cpp -o gemm

#### C吞吐量评估 /BenchC/PolyBenchC-4.2.1

/BenchC/PolyBenchC-4.2.1/Test  编译命令：gcc -O3

/BenchC/PolyBenchC-4.2.1/Test-fopenmp  编译命令：gcc -O3 -fopenmp

编译方法：
cd Test
gcc -O3 -I ../utilities -I ../linear-algebra/kernels/atax ../utilities/polybench.c ../linear-algebra/kernels/atax/atax.c -DPOLYBENCH_DUMP_ARRAYS -o atax_ref

#### C带宽评估 /BenchC/STREAMbenchmark

/BenchC/STREAMbenchmark/stream_c   编译命令：gcc -O3

/BenchC/STREAMbenchmark/stream_c_fopenmp  编译命令：gcc -O3 -fopenmp 
//（线程绑核也执行这个文件即可 ./stream_c_fopenmp）

编译方法：gcc -O3 -fopenmp stream.c -o stream_c_fopenmp

#### 线程绑核需要提前设置的环境变量
##### GCC OpenMP 
export GOMP_CPU_AFFINITY="0-63" //线程亲和性

export OMP_PROC_BIND="true" //线程尽可能紧密地绑定到其启动的CPU核心

export OMP_PLACES=cores //线程存放在物理核心

export OMP_NUM_THREADS=1/8/16/32/64 //最大线程数

//启动64个线程执行
yhrun -N 1 -n 1 -c 64 -p thcp1 ./gemm_fopenmp

##### DPC++ POCL
export POCL_AFFINITY=1  //线程亲和性

export POCL_MAX_PTHREAD_COUNT=1/8/16/32/64 //最大线程数

//启动64个线程执行
yhrun -N 1 -n 1 -c 64 -p thcp1 ./gemm --size=1024 --num-runs=10




