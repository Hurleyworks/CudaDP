#pragma once

// a man's reach should exceed his grasp
// Words from a poem by Robert Browning, suggesting that, to achieve anything worthwhile,
// a person should attempt even those things that may turn out to be impossible.

#include <unordered_map>
#include <unordered_set>
#include <array>
#include <queue>
#include <stack>
#include <fstream>
#include <set>
#include <vector>
#include <sstream>
#include <iomanip> // byteStr()
#include <random>
#include <chrono>
#include <thread>
#include <ctime>
#include <string>
#include <iostream>
#include <stdexcept>
#include <assert.h>
#include <limits>
#include <algorithm>
#include <functional>
#include <stdint.h>
#include <any>
#include <filesystem>
#include <mutex>
#include <memory>
#include <condition_variable>

// NO MORE TRACING  Yay
#define TRACE(x)


// g3log
#include <g3log/g3log.hpp>
#include <g3log/logworker.hpp>

// some useful tools and defines outside mace namespace
#include "excludeFromBuild/basics/Defaults.h"
#include "excludeFromBuild/basics/Util.h"

namespace mace
{
	#include "excludeFromBuild/basics/StringUtil.h"
	

} // namespace mace

