module test_julia_expr_inline

using Test
using MacroTools

if VERSION >= v"1.8.0-DEV.450"

expr = @expand(let
    f(a) = 1a
    g(a) = 2a
    @inline f(2) + g(3)
end)

prettify(expr)

@test Meta.eval(expr) == 8

end

end # module test_julia_expr_inline
