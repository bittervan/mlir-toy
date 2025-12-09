#include "mlir/IR/DialectRegistry.h"
#include "mlir/Tools/mlir-opt/MlirOptMain.h"
#include "mlir/Dialect/Func/IR/FuncOps.h"
#include "mlir/Transforms/Passes.h"
#include "toy/ToyDialect.h"

using namespace mlir;

int main(int argc, char *argv[]) {
    DialectRegistry registry;
    registry.insert<toy::ToyDialect, func::FuncDialect>();
    registerCSEPass();
    registerCanonicalizerPass();
    return asMainReturnCode(MlirOptMain(argc, argv, "toy-opt", registry));
}
