module test_julia_subtype_union

using Test

@test Union isa DataType

@test Union{} === Base.Bottom
@test Union{} isa Core.TypeofBottom
@test Union{} !== Union

@test 1 isa Union{Int, String}
@test "" isa Union{Int, String}

@test Vector isa UnionAll
@test Vector{} === Vector

@test Tuple{} !== Tuple

end # module test_julia_subtype_union
