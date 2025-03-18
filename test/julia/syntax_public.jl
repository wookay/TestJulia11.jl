using Jive
@If VERSION >= v"1.11" module test_julia_syntax_public

#=
Julia v1.11
`public` is a new keyword. Symbols marked with `public` are considered public
API. Symbols marked with `export` are now also treated as public API. The
difference between `public` and `export` is that `public` names do not become
available when `using` a package/module.
=#

module Mod
    export foo
    public bar

const foo = 1
const bar = 2
end # module Mod

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
end # module M2

@test names(M2; imported=false) == [:M2]
@test names(M2; imported=true) == [:M2]

if VERSION >= v"1.12.0-DEV.163"
    @test names(M2; usings=false) == [:M2]
    m2_names_usings_true = names(M2; usings=true)
    @test :foo in m2_names_usings_true
    @test :bar in m2_names_usings_true
    @test :+   in m2_names_usings_true
end


module M3

using Test
using ..Mod

@test foo == 1                   # export foo
@test_throws UndefVarError bar   # public bar

end # module M3

end # @If VERSION >= v"1.11" module test_julia_syntax_public
