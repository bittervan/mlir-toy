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

# Collect main source files
set(MAIN_SOURCES
    main.cpp
)

# Collect parser source files
file(GLOB PARSER_SOURCES
    "parser/*.cpp"
)

# Collect mlir source files
file(GLOB MLIR_SOURCES
    "mlir/*.cpp"
)

# Combine all sources
set(ALL_SOURCES
    ${MAIN_SOURCES}
    ${PARSER_SOURCES}
    ${MLIR_SOURCES}
)

add_executable(mlir-toy ${ALL_SOURCES})

target_link_libraries(
    mlir-toy
    MLIRIR
    MLIRParser
    MLIRFuncDialect
    MLIRArithDialect
)