using Jive
@If VERSION >= v"1.5.0-DEV.300" module test_julia_int_bitreverse

using Test

@test bitreverse(0x80) == 0x01

end # module test_julia_int_bitreverse


@If VERSION >= v"1.5.0-DEV.517" module test_julia_int_signed

using Test

@test signed(UInt32) === Int32
@test unsigned(Int32) === UInt32

end # module test_julia_int_signed
