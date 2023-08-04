module test_julia_rounding_irrationals

using Test

if VERSION >= v"1.11.0-DEV.225"
    @test round(Int, pi) == 3
else
    @test_throws MethodError round(Int, pi)
end

end # module test_julia_rounding_irrationals
