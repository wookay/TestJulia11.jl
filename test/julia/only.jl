using Jive
@If VERSION >= v"1.4.0-DEV.142" module test_julia_only

using Test

@test only(1) == only([1]) == only((a=1,)) == 1

end # module test_julia_only
