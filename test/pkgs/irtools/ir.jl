module test_pkgs_irtools_ir

using Test
using IRTools # code_ir

ir = IRTools.code_ir(+, Tuple{Int, Int})
@test ir isa IRTools.IR

if VERSION >= v"1.2.0-DEV"
    @test sprint(show, ir) == "1:\n  %1 = Base.add_int(_2, _3)\n  return %1\n"
else
    @test sprint(show, ir) == "1:\n  %1 = (Base.add_int)(_2, _3)\n  return %1\n"
end

end # module test_pkgs_irtools_ir
