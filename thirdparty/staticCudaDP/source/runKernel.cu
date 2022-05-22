#include "runKernel.h"

__global__ void parent_k (void);
//__global__ ParentKernel ();

int runKernel (int digit)
{
    try
    {
        CUcontext cuContext;
        int cuDeviceCount = 0;
        CUDADRV_CHECK (cuInit (0));
        CUDADRV_CHECK (cuDeviceGetCount (&cuDeviceCount));
        CUDADRV_CHECK (cuCtxCreate (&cuContext, 0, 0));
        cuCtxSetCurrent (cuContext);

        parent_k<<<2, 2>>>();
       // ParentKernel<<<8, 32>>> ();
        checkCudaErrors (cudaGetLastError());
        checkCudaErrors (cudaDeviceSynchronize());
    }
    catch (std::exception& e)
    {
        std::cout << e.what() << std::endl;
    }

    return 0;
}
