cmake_minimum_required(VERSION 3.13.4)

project(mlir-toy VERSION 0.0.0)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED YES)

find_package(MLIR REQUIRED CONFIG)
list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")

include(TableGen)
include(AddLLVM)
include(AddMLIR)
include(HandleLLVMOptions)

include_directories(${LLVM_INCLUDE_DIRS} ${MLIR_INCLUDE_DIRS})
include_directories(include)
include_directories(${CMAKE_BINARY_DIR}/include)

add_mlir_tool(ex3-opt main.cpp)

add_subdirectory(include/toy)
add_subdirectory(lib)
target_link_libraries(ex3-opt
PRIVATE Toy
    MLIRIR
    Toy
    MLIRSupport
    MLIROptLib
    MLIRFuncDialect
    MLIRTransforms
)

# Set ex3-opt as the default build target
add_custom_target(default ALL DEPENDS ex3-opt)