#include "runKernel.h"

__global__ void parent_k (void);

int runKernel (int digit)
{
    CUcontext cuContext;
    int cuDeviceCount = 0;
    cuInit (0);
    cuDeviceGetCount (&cuDeviceCount);
    cuCtxCreate (&cuContext, 0, 0);
    cuCtxSetCurrent (cuContext);

    parent_k<<<2, 2>>>();
    cudaDeviceSynchronize();
    return 0;
}
