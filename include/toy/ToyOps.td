#ifndef TOY_OPS_TD
#define TOY_OPS_TD

include "mlir/IR/OpBase.td"
include "toy/ToyDialect.td"
include "mlir/Interfaces/SideEffectInterfaces.td"

class ToyOp<string mnemonic, list<Trait> traits = []> :
    Op<ToyDialect, mnemonic, traits>;

def AddOp : ToyOp<"add", [Pure]> {
    let summary = "add operation";
    let arguments = (ins Varaidic<AnyInteger>:$inputs);
    let results = (outs AnyInteger:$results);
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

#endif