#include "Jahley.h"

const std::string APP_NAME = "HelloCudaDP";

int runKernel();

class Application : public Jahley::App
{
 public:
    Application() :
        Jahley::App()
    {
        try
        {
            LOG (DBUG) << "Hello CPU!";
            int result = runKernel();
            if (result == 1)
            {
                LOG (CRITICAL) << "Cuda Dynamic Parallelism failed";
            }
        }
        catch (std::exception& e)
        {
            std::cout << e.what() << std::endl;
        }
    }

    ~Application()
    {
    }

    void onCrash() override
    {
    }

 private:
};

Jahley::App* Jahley::CreateApplication()
{
    return new Application();
}
