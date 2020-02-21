using Jive
@If VERSION >= v"1.5.0-DEV.302" module test_julia_operators_bbsemi

using Test

f ⨟ g = g ∘ f

@test (uppercase ∘ Char ∘ Int)('a') == (Int ⨟ Char ⨟ uppercase)('a') == 'A'

end # module test_julia_operators_bbsemi
