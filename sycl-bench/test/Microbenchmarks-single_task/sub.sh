#!/bin/bash
export OMP_NUM_THREADS=64
yhrun -n 1 -c 64 -p thcp1 DRAM-single_task --size=16384 --num-runs=3
