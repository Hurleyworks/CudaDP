#include <stdio.h>
#include <cuda.h>
#include <cuda_runtime.h>

// good tutorial
// https://www.youtube.com/watch?v=vP2boVIlfPA&list=PLnqGt7opCGJEg8qNdJBOfbVr7QZnmUYEq&index=5&ab_channel=Udacity

__global__ void child_k (void)
{
    printf ("************* Hello from the child_k!\n");
}

__global__ void parent_k (void)
{
    printf ("******** Hello from the parent_k *******!\n");

    // this causes a cudaLaunchKernel cudaErrorInvalidSource(300) error
    child_k<<<2, 2>>>();

     // Warning: Explicit synchronization with child kernels from a parent block
    // (i.e. using cudaDeviceSynchronize() in device code) is deprecated in CUDA 11.6,
    // and is slated for removal in a future CUDA release.
    // checkCudaErrors(cudaDeviceSynchronize());
}
