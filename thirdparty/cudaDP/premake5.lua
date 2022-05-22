
local ROOT = "../"

project "cudaDP"
kind "StaticLib"
    language "C++"
	flags { "MultiProcessorCompile", "NoMinimalRebuild" }
	
	if _ACTION == "vs2019" then
		cppdialect "C++17"
		location (ROOT .. "builds/VisualStudio2019/projects")
    end
	
	if _ACTION == "vs2022" then
		cppdialect "C++17"
		location (ROOT .. "builds/VisualStudio2022/projects")
    end
	
	targetdir (ROOT .. "builds/bin/" .. outputdir .. "/%{prj.name}")
	objdir (ROOT .. "builds/bin-int/" .. outputdir .. "/%{prj.name}")

	local SOURCE_DIR = "source/"
	files
    { 
      "source/runKernel.h"
    }
	includedirs
	{
		
	}
	
-- Add necessary build customization using standard Premake5
buildcustomizations "BuildCustomizations/CUDA 11.6"

-- CUDA specific properties
cudaFiles {"cudaDP/" .. SOURCE_DIR .. "/**.cu"} -- files NVCC compiles
cudaMaxRegCount "32"

-- Let's compile for all supported architectures (and also in parallel with -t0)
cudaCompilerOptions {"-arch=sm_75", 
                     "-gencode=arch=compute_75,code=sm_75", 
					 "--extended-lambda",
                      "-t0"}                      

filter "system:windows"
		cudaRelocatableCode "On"
        staticruntime "On"
		characterset ("MBCS")
		buildoptions { "/Zm250"}
        disablewarnings { "4244", "4101", "4267", "4018" }
        files
        {
			
        }

		defines 
		{ 
            "_CRT_SECURE_NO_WARNINGS",
		}
		filter { "system:windows", "configurations:Release"}
			buildoptions "/MT"     
			cudaFastMath "On" -- enable fast math for release

		filter { "system:windows", "configurations:Debug"}
			buildoptions "/MTd"  
			
			
