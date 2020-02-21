using Jive
@If VERSION >= v"1.5.0-DEV.300" module test_julia_int

using Test

@test bitreverse(0x80) == 0x01

end # module test_julia_int
