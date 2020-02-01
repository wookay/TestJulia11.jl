using Jive
@If VERSION >= v"1.5.0-DEV.182" module test_julia_abstractdict_mergewith

using Test

@test mergewith(+, Dict(:a=>1), Dict(:a=>2)) == Dict(:a=>3)

end # @If VERSION >= v"1.5.0-DEV.182" module test_julia_abstractdict_mergewith
