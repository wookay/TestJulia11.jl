module test_julia_compiler

using Test

ci = code_lowered(()->return nothing)[1]
ir = Core.Compiler.inflate_ir(ci)
@test Core.Compiler.verify_ir(ir) === nothing

if VERSION >= v"1.9.0-DEV.1611"
    using Core.Compiler: IRCode
    ir = IRCode()
    if VERSION >= v"1.11"
        # End of BB 1 (1) is not one less than CFG index (1)
        # 1 ─     return nothing
        @test_throws ErrorException Core.Compiler.verify_ir(ir)
    end
end

if VERSION >= v"1.2.0-DEV.205"
    # julia/base/sysimg.jl
    maxlen = 14 # maximum(textwidth.(string.(stdlibs)))
    function print_time(mod, t)
        print(rpad(string(mod) * "  ", maxlen + 3, "─"))
        if hasmethod(Base.time_print, Tuple{Float64})
            Base.time_print(t * 10^9)
        else
            Base.time_print(stdout, t * 10^9)
        end
        println()
    end
    base_include_time = (Base.end_base_include - Base.start_base_include) * 10^(-9)
    print_time(Base, base_include_time)
end

@test_throws TypeError Base.typejoin(1, Int)
Base.typejoin(x, ::Type) = 0
@test Base.typejoin(1, Int) == 0
Base.delete_method(which(Base.typejoin, Tuple{Any, Type{Int}}))
@test_throws TypeError Base.typejoin(1, Int)

end # module test_julia_compiler
