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
@test Core.kwfunc(kwf)((x=2,), kwf) == 7

end # @If VERSION >= v"1.6.0-DEV.736" module test_julia_bodyfunction


module test_julia_destructure_callex

using Test

macro destructure(ex)
    f, args, kwargs = Base.destructure_callex(ex)
    (f, args, kwargs)
end

(f, args, kwargs) = @destructure f(a::Int; b=2)
@test f === :f
@test args == Any[:(a::Int)]
@test kwargs == Any[Expr(:kw, :b, 2)]

@test (f, args, kwargs) == Base.destructure_callex(:(f(a::Int; b=2)))

q = quote f(a::Int; b=2) end
@test q.args[1] isa LineNumberNode
@test :(f(a::Int; b=2)) == q.args[2]

end # module test_julia_destructure_callex
