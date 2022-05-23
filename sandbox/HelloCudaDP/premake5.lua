local ROOT = "../../"

project  "HelloCudaDP"
	if _ACTION == "vs2019" then
		cppdialect "C++17"
		location (ROOT .. "builds/VisualStudio2019/projects")
    end
	
	if _ACTION == "vs2022" then
		cppdialect "C++17"
		location (ROOT .. "builds/VisualStudio2022/projects")
    end
	
	kind "ConsoleApp"

	local SOURCE_DIR = "source/*"
    files
    { 
      SOURCE_DIR .. "**.h", 
      SOURCE_DIR .. "**.hpp", 
      SOURCE_DIR .. "**.c",
      SOURCE_DIR .. "**.cpp",
    }
	
	includedirs
	{
	
	}
	
	-- Add necessary build customization using standard Premake5
	buildcustomizations "BuildCustomizations/CUDA 11.7"

	-- CUDA specific properties
	cudaFiles {"sandbox/HelloCudaDP/" .. SOURCE_DIR .. "*.cu"} -- files NVCC compiles
	cudaMaxRegCount "32"

	-- Let's compile for all supported architectures (and also in parallel with -t0)
	cudaCompilerOptions {"-arch=sm_75", 
						 "-gencode=arch=compute_75,code=sm_75", 
						 "--extended-lambda",
						  "-t0"}                      


	filter "system:windows"
		cudaRelocatableCode "On" 
		staticruntime "On"
		systemversion "latest"
		defines {"_CRT_SECURE_NO_WARNINGS", "__WINDOWS_WASAPI__", "NOMINMAX",
				  "NANOGUI_USE_OPENGL", "NANOGUI_GLAD",
		}
		
		disablewarnings { "5030" , "4305", "4316", "4267"}
		vpaths 
		{
		  ["Header Files/*"] = { 
			SOURCE_DIR .. "**.h", 
			SOURCE_DIR .. "**.hxx", 
			SOURCE_DIR .. "**.hpp",
		  },
		  ["Source Files/*"] = { 
			SOURCE_DIR .. "**.c", 
			SOURCE_DIR .. "**.cxx", 
			SOURCE_DIR .. "**.cpp",
		  },
		}
		
-- add settings common to all project
dofile("../../build_tools/common.lua")


