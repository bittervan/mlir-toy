#include "mlir/IR/DialectRegistry.h"
#include "toy/ToyDialect.h"
#include <iostream>

using namespace mlir;

int main(int argc, char *argv[]) {
    std::cout << "MLIR Toy Tool - Basic functionality test" << std::endl;

    DialectRegistry registry;
    registry.insert<toy::ToyDialect>();

    // Test that our dialect can be loaded
    MLIRContext context(registry);
    context.loadAllAvailableDialects();

    std::cout << "Toy dialect registered successfully!" << std::endl;
    return 0;
}
