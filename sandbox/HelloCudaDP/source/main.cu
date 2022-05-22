#include <cuda.h>
#include <cudaDP/source/runKernel.h>



int callKernel (int digit)
{
    runKernel (digit);
    return 0;
}
