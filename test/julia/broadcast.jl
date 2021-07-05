using Jive
@If VERSION >= v"1.6.0-DEV.1144" module test_julia_broadcast

using Test

@test (.+) isa Base.BroadcastFunction
@test (.+).f === +

f(x) = 3x
@test f.([1, 2, 3]) == Base.BroadcastFunction(f)([1, 2, 3]) == [3, 6, 9]

end # module test_julia_broadcast
