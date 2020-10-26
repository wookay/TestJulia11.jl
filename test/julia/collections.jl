using Jive
@If VERSION >= v"1.6.0-DEV.1334" module test_julia_collections_rest

using Test

first, state = iterate([1, 2, 3, 4, 5])
@test first == 1
@test state == 2

@test Base.rest([1, 2, 3, 4, 5], 2) == [2, 3, 4, 5]

end # module test_julia_collections_rest
