#include <stdio.h>

__global__ void childKernel()
{
    printf ("Hello ");
}

__global__ void parentKernel()
{
    // launch child
    childKernel<<<1, 1>>>();
    if (cudaSuccess != cudaGetLastError())
    {
        return;
    }
    // Warning: Explicit synchronization with child kernels from a parent block
    // (i.e. using cudaDeviceSynchronize() in device code) is deprecated in CUDA 11.6,
    // and is slated for removal in a future CUDA release.
    //
    // wait for child to complete
    /* if (cudaSuccess != cudaDeviceSynchronize())
     {
         return;
     }*/

    printf ("World!\n");
}
