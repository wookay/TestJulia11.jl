using Jive
@If VERSION >= v"1.3-rc" module test_julia_var

using Test

var"a" = 1
@test a === var"a" == 1

end # module test_julia_var
