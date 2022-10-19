module test_julia_compiler

using Test

ci = code_lowered(()->return nothing)[1]
ir = Core.Compiler.inflate_ir(ci)
@test Core.Compiler.verify_ir(ir) === nothing

if VERSION >= v"1.9.0-DEV.1611"
using Core.Compiler: IRCode
ir = IRCode()
@test Core.Compiler.verify_ir(ir) === nothing
end

end # module test_julia_compiler
