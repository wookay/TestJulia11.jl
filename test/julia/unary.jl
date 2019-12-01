# must be VERSION >= v"1.2"
module test_julia_unary

using Test

# Julia PR #31604

⋆(a) = 2a
@test ⋆3 == 6


# Julia issue #33859

f() = 1
g() = 2
h() = 3

x = f() + g() - h()
@test x == 0

x = f() + g()
        - h()
@test x == 3

end # module test_julia_unary
