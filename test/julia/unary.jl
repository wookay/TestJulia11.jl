# must be VERSION >= v"1.2"
module test_julia_unary

using Test

# Julia PR #31604

⋆(a) = 2a
@test ⋆3 == 6

end # module test_julia_unary
