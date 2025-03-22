module test_julia_core_intrinsics

using Test
using Core.Intrinsics

@test bitcast isa Core.IntrinsicFunction

end # module test_julia_core_intrinsics
