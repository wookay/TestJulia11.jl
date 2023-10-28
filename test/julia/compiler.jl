module test_julia_compiler

using Test

ci = code_lowered(()->return nothing)[1]
ir = Core.Compiler.inflate_ir(ci)
@test Core.Compiler.verify_ir(ir) === nothing

if VERSION >= v"1.9.0-DEV.1611"
    using Core.Compiler: IRCode
    ir = IRCode()
    if VERSION >= v"1.11"
        @test_throws ErrorException Core.Compiler.verify_ir(ir)
    end
end

end # module test_julia_compiler
