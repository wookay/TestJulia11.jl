using Jive
@If VERSION >= v"1.9.0-DEV.351" module test_julia_slurping

using Test

a,b...,c = 1,2,3
@test a == 1
@test b == (2,)
@test c == 3

end # module test_julia_slurping
