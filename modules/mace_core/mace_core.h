#pragma once

#include <iostream>

#define WIN32_LEAN_AND_MEAN
#if defined(_WIN32) || defined(_WIN64)
#define __FUNCTION_NAME__ __func__
#define _FN_ __FUNCTION_NAME__
#ifndef NOMINMAX
#define NOMINMAX
#endif
#include <Windows.h>
#undef near
#undef far
#undef RGB
#endif

// NO MORE TRACING  Yay
#define TRACE(x)

// g3log
#include <g3log/g3log.hpp>
#include <g3log/logworker.hpp>

const LEVELS TESTING{INFO.value + 1, "TESTING"};
const LEVELS CRITICAL{WARNING.value + 1, "CRTICAL"};

struct DesktopWindowSettings{};

#if 0
// some useful tools and defines outside mace namespace
#include "excludeFromBuild/basics/Defaults.h"
#include "excludeFromBuild/basics/Util.h"

namespace mace
{
#include "excludeFromBuild/basics/StringUtil.h"

} // namespace mace

#endif
