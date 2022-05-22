#include "runKernel.h"


__global__ void parent_k (void);

int runKernel (int digit)
{
    CUcontext cuContext;
    CUstream cuStream;
    int cuDeviceCount = 0;
    cuInit (0);
    cuDeviceGetCount (&cuDeviceCount);
    cuCtxCreate (&cuContext, 0, 0);
    cuCtxSetCurrent (cuContext);
    cuStreamCreate (&cuStream, 0);

    parent_k<<<1, 1>>>();
    cudaDeviceSynchronize();
    return 0;
}
