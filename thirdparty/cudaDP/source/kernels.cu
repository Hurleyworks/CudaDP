#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime.h>

__global__ void child_k (void)
{
    printf ("************* Hello from the child_k!\n");
}

__global__ void parent_k (void)
{
    printf ("***************** Hello from the parent_k!\n");
  // child_k<<<1, 1>>>();

    // cudaDeviceSynchronize();
}