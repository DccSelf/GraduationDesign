#ifndef _ARITH_H
# define _ARITH_H

/* Default to SMALL_DATASET. */
# if !defined(MINI_DATASET) && !defined(SMALL_DATASET) && !defined(MEDIUM_DATASET) && !defined(LARGE_DATASET) && !defined(EXTRALARGE_DATASET)
#  define LARGE_DATASET
# endif

# if !defined(SIZE)
/* Define sample dataset sizes. */
#  ifdef MINI_DATASET
#   define SIZE 512
#  endif

#  ifdef SMALL_DATASET
#   define SIZE 1024
#  endif

#  ifdef MEDIUM_DATASET
#   define SIZE 2048
#  endif

#  ifdef LARGE_DATASET
#   define SIZE 1048576
#  endif

#  ifdef EXTRALARGE_DATASET
#   define SIZE 8192
#  endif


#endif /* !(SIZE) */

# define _PB_SIZE POLYBENCH_LOOP_BOUND(SIZE,size)


/* Default data type */
# if !defined(DATA_TYPE_IS_INT) && !defined(DATA_TYPE_IS_FLOAT) && !defined(DATA_TYPE_IS_DOUBLE)
#  define DATA_TYPE_IS_FLOAT
# endif

#ifdef DATA_TYPE_IS_INT
#  define DATA_TYPE int
#  define DATA_PRINTF_MODIFIER "%d "
#endif

#ifdef DATA_TYPE_IS_FLOAT
#  define DATA_TYPE float
#  define DATA_PRINTF_MODIFIER "%0.2f "
# endif

#ifdef DATA_TYPE_IS_DOUBLE
#  define DATA_TYPE double
#  define DATA_PRINTF_MODIFIER "%0.2lf "
# endif

#endif /* !_ARITH_H */
