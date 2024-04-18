
/* arith.c: this file created by dcc*/

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

/* Include polybench common header. */
#include <polybench.h>

/* Include benchmark-specific header. */
#include "arith.h"


/* Array initialization. */
static void init_array(int size,DATA_TYPE POLYBENCH_1D(out,SIZE,size),DATA_TYPE POLYBENCH_1D(in,SIZE,size))
{
  int i;
  for (i = 0; i < size; i++)
      out[i] = 0;
  for (i = 0; i < size; i++)
      in[i] = 1;
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static void print_array(int size,DATA_TYPE POLYBENCH_1D(out,SIZE,size))
{
  int i;
  POLYBENCH_DUMP_START;
  POLYBENCH_DUMP_BEGIN("C");
  for (i = 0; i < size; i++){
       if (i % 100 == 0) fprintf (POLYBENCH_DUMP_TARGET, "\n");
	fprintf (POLYBENCH_DUMP_TARGET, DATA_PRINTF_MODIFIER, out[i]);
  }
  POLYBENCH_DUMP_END("C");
  POLYBENCH_DUMP_FINISH;
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static void kernel_arith(int size,DATA_TYPE POLYBENCH_1D(out,SIZE,size),DATA_TYPE POLYBENCH_1D(in,SIZE,size))
{
  
#pragma scop
#pragma omp parallel for
  for (int gid = 0; gid < _PB_SIZE; gid++) {
     DATA_TYPE a1 = in[gid];
     const DATA_TYPE a2 = a1;
     for(int i = 0;i < 512; i++){
        a1 = a1 * a1 + a1;
        a1 = a1 * a2 - a2;
    }
    out[gid] = a1;
  }
#pragma endscop
}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int size = SIZE;

  /* Variable declaration/allocation. */
  POLYBENCH_1D_ARRAY_DECL(out,DATA_TYPE,SIZE,size);
  POLYBENCH_1D_ARRAY_DECL(in,DATA_TYPE,SIZE,size);

  /* Initialize array(s). */
  init_array (size, POLYBENCH_ARRAY(out),POLYBENCH_ARRAY(in));

  /* Start timer. */
  polybench_start_instruments;

  /* Run kernel. */
  kernel_arith (size,POLYBENCH_ARRAY(out),POLYBENCH_ARRAY(in));

  /* Stop and print timer. */
  polybench_stop_instruments;
  polybench_print_instruments;

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  polybench_prevent_dce(print_array(size, POLYBENCH_ARRAY(out)));

  /* Be clean. */
  POLYBENCH_FREE_ARRAY(in);
  POLYBENCH_FREE_ARRAY(out);

  return 0;
}
