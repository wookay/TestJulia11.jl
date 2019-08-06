@If VERSION >= v"1.3.0-alpha.62" module test_julia_nothing

using Test

@test println(nothing) === nothing

end # module test_julia_nothing
