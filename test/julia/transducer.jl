using Jive
@If VERSION >= v"1.4.0-DEV.560" module test_julia_transducer

using Test

@test Base.FlipArgs(+)(1, 2) == 3

end # module test_julia_transducer
