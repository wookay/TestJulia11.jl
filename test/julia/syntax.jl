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


@If VERSION >= v"1.12.0-DEV.163" module test_julia_syntax_public

module Mod
    export foo
    public bar

const foo = 1
const bar = 2
end

using Test

@test Base.ispublic(Mod, :Mod)
@test Base.ispublic(Mod, :foo)
@test Base.ispublic(Mod, :bar)

@test Base.isexported(Mod, :Mod)
@test Base.isexported(Mod, :foo)
@test !Base.isexported(Mod, :bar)

@test names(Mod) == [:Mod, :bar, :foo]

module M2
using ..Mod: foo, bar
end

@test names(M2; usings=false) == [:M2]
m2_names_usings_true = names(M2; usings=true)
@test :foo in m2_names_usings_true
@test :bar in m2_names_usings_true
@test :+   in m2_names_usings_true

@test names(M2; imported=false) == [:M2]
@test names(M2; imported=true) == [:M2]

end # @If VERSION >= v"1.12.0-DEV.163" module test_julia_syntax_public
