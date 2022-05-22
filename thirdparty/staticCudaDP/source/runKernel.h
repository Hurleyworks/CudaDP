#include <cuda.h>
#include <cuda_runtime.h>
#include <iostream>
#include <sstream>

// CUDA Runtime error messages
#ifdef __DRIVER_TYPES_H__
static const char* _cudaGetErrorEnum (cudaError_t error)
{
    return cudaGetErrorName (error);
}
#endif

// CUDA Driver API errors
static const char* _cudaGetErrorEnum (CUresult error)
{
    static char unknown[] = "<unknown>";
    const char* ret = NULL;
    cuGetErrorName (error, &ret);
    return ret ? ret : unknown;
}

template <typename T>
void check (T result, char const* const func, const char* const file, int const line)
{
    if (result)
    {
        fprintf (stderr, "CUDA error at %s:%d code=%d(%s) \"%s\" \n",
                 file, line, static_cast<unsigned int> (result), _cudaGetErrorEnum (result), func);
        
    }
}

#define checkCudaErrors(val) check ((val), #val, __FILE__, __LINE__)

#define CUDADRV_CHECK(call) \
    do \
    { \
        CUresult error = call; \
        if (error != CUDA_SUCCESS) \
        { \
            std::stringstream ss; \
            const char* errMsg = "failed to get an error message."; \
            cuGetErrorString (error, &errMsg); \
            ss << "CUDA call (" << #call << " ) failed with error: '" \
               << errMsg \
               << "' (" __FILE__ << ":" << __LINE__ << ")\n"; \
            throw std::runtime_error (ss.str().c_str()); \
        } \
    } while (0)

#define CUDA_CHECK(call) \
    do \
    { \
        cudaError_t error = call; \
        if (error != cudaSuccess) \
        { \
            std::stringstream ss; \
            ss << "CUDA call (" << #call << " ) failed with error: '" \
               << cudaGetErrorString (error) \
               << "' (" __FILE__ << ":" << __LINE__ << ")\n"; \
            throw std::runtime_error (ss.str().c_str()); \
        } \
    } while (0)


__host__ int runKernel (int digit);