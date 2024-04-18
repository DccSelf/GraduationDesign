#!/bin/bash
export OMP_NUM_THREADS=64
yhrun -n 1 -c 64 -p thcp1 gemm --size=1024 --num-runs=3
