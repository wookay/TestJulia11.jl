using  Jive
@If VERSION >= v"1.5.0-DEV.124" module test_julia_abstractset

using Test

@test isdisjoint(1, 2)
@test isdisjoint([1], [2])
@test !isdisjoint([1, 2], [1])
@test !isdisjoint(Set([1, 2]), 1)
@test !isdisjoint(1:5, 5:6)

end # module test_julia_abstractset
