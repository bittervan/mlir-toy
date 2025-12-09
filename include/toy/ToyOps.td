include "mlir/IR/OpBase.td"
include "mlir/Interfaces/SideEffectInterfaces.td"
include "toy/ToyDialect.td"

class ToyOp<string mnemonic, list<Trait> traits = []> :
    Op<ToyDialect, mnemonic, traits>;

def AddOp : ToyOp<"add", [Pure]> {
    let summary = "add operation";
    let arguments = (ins Variadic<AnyInteger>:$inputs);
    let results = (outs AnyInteger:$result);
}

def SubOp : ToyOp<"sub", [Pure]> {
    let summary = "sub operation";
    let arguments = (ins AnyInteger:$lhs, AnyInteger:$rhs);
    let results = (outs AnyInteger:$result);
}

def ConstantOp : ToyOp<"const", [Pure]> {
    let summary = "const operation";
    let arguments = (ins APIntAttr:$value);
    let results = (outs AnyInteger:$result);
}