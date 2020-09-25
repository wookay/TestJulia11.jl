using Jive
@If VERSION >= v"1.4.0-DEV.329" module test_julia_operators

using Test

f(x) = 2x
g(x) = x/2
h(x) = x

@test (f ∘ g ∘ h) === ∘(f, g, h) === ∘((f, g, h)...)
@test (f ∘ g ∘ h)(10) == 10

end # module test_julia_operators


@If VERSION >= v"1.5.0-DEV.56" module test_julia_operators_composition

using Test

@test ∘(1) == 1

end # module test_julia_operators_composition


@If VERSION >= v"1.6.0-DEV.85" module test_julia_operators_composedfunction

using Test

c = (+) ∘ (-)
if VERSION >= v"1.6.0-DEV.1037"
    @test c isa Base.ComposedFunction
    @test c.outer === +
    @test c.inner === -
else
    @test c.f === +
    @test c.g === -
end

end # module test_julia_operators_composedfunction
