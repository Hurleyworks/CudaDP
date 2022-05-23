#include <cuda_runtime.h>

__global__ void parentKernel();

int runKernel()
{
    // launch parent
    parentKernel<<<1, 1>>>();
    if (cudaSuccess != cudaGetLastError())
    {
        return 1;
    }

    // wait for parent to complete
    if (cudaSuccess != cudaDeviceSynchronize())
    {
        return 2;
    }
    return 0;
}
