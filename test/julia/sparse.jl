module test_julia_sparse

using Test
using SparseArrays

@test indexin([100, 100, 200, 300], [100]) == [1, 1, nothing, nothing]

a = sparse([100, 100, 200, 300])
@test indexin(a, [100]) == [1, 1, nothing, nothing]

end # module test_julia_sparse
