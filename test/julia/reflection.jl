using Jive
@If VERSION >= v"1.2.0-DEV.272" module test_julia_reflection

using Test

struct G
    field
end
@test Base.hasfield(G, :field)

using LinearAlgebra
A = [4 3; 6 3]
@test Base.hasproperty(lu(A), :L)

end # @If VERSION >= v"1.2.0-DEV.272" module test_julia_reflection


@If VERSION >= v"1.4.0-DEV.581" module test_julia_methods

using Test

module G
f() = 2
end

m = first(methods(G.f, G))
@test m isa Method
@test m.module === G
@test m.name === :f

end # @If VERSION >= v"1.4.0-DEV.581" module test_julia_methods


@If VERSION >= v"1.5.0-DEV.247" module test_julia_ismutable

using Test

@test !ismutable((a=1,))
@test ismutable(Dict(:a=>1))

end # @If VERSION >= v"1.5.0-DEV.247" module test_julia_ismutable


@If VERSION >= v"1.6.0-DEV.736" module test_julia_bodyfunction

using Test

kwf(; x) = 3x + 1
@test Base.bodyfunction(first(methods(kwf)))(2, kwf) == 7
# removed by Julia PR 47157
# @test Core.kwfunc(kwf)((x=2,), kwf) == 7

end # @If VERSION >= v"1.6.0-DEV.736" module test_julia_bodyfunction
