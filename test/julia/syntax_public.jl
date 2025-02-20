using Jive
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
