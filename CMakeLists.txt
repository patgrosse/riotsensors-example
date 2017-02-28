# =============================================================================
# project should not be compiled with cmake, use RIOT OS's make structure instead
# CMake is just here for IDEs
# =============================================================================
cmake_minimum_required(VERSION 3.0)
project(riotsensors-example)

set(LIB_DIR "${CMAKE_SOURCE_DIR}/lib")

set(CMAKE_C_COMPILER "arm-none-eabi-gcc")

include_directories("${LIB_DIR}/riotsensors/riotmodule/include")
include_directories("${LIB_DIR}/riotsensors/protocol/include")
include_directories("${LIB_DIR}/libspt/src/include")

include_directories("${LIB_DIR}/RIOT/core/include")
include_directories("${LIB_DIR}/RIOT/sys/include")
include_directories("${LIB_DIR}/RIOT/sys/posix/pthread/include")
include_directories("${LIB_DIR}/RIOT/drivers/include")
include_directories("${LIB_DIR}/RIOT/drivers/cc110x/include")
include_directories("${LIB_DIR}/RIOT/boards/msba2/include")
include_directories("${LIB_DIR}/RIOT/boards/msba2-common/include")
include_directories("${LIB_DIR}/RIOT/cpu/lpc2387/include")

set(SOURCE_FILES main.c)

add_library(riotsensors-example ${SOURCE_FILES})