using Jive
@If VERSION >= v"1.8.0-DEV.118" module test_julia_syntax

using Test

(a, f()...) = (1, 2, 3)
@test f() == (2, 3)

(a, b, f()...) = (1, 2, 3)
@test f() == (3,)

(a, b, c, f()...) = (1, 2, 3)
@test f() == ()

end # @If VERSION >= v"1.8.0-DEV.118" module test_julia_syntax



@If VERSION >= v"1.8.0-DEV.178" module test_julia_syntax_nargs

using Test

const nargs_max = 520000
ex = Expr(:tuple)
ex.args = fill!(Vector{Any}(undef, nargs_max), 1)
tup = eval(ex)
@test length(tup) == nargs_max

ex.args = fill!(Vector{Any}(undef, nargs_max+1), 1)
@test_throws ErrorException("syntax: expression too large") eval(ex)

end # @If VERSION >= v"1.8.0-DEV.178" module test_julia_syntax_nargs
