module test_stdlib_sparsearrays

using Test
using SparseArrays

@test indexin([100, 100, 200, 300], [100]) == [1, 1, nothing, nothing]

a = sparse([100, 100, 200, 300])
@test indexin(a, [100]) == [1, 1, nothing, nothing]

if VERSION >= v"1.7.0-DEV.1299"
@test sprint(show, sparse(reshape(1:9,3,:))) == "sparse([1, 2, 3, 1, 2, 3, 1, 2, 3], [1, 1, 1, 2, 2, 2, 3, 3, 3], [1, 2, 3, 4, 5, 6, 7, 8, 9], 3, 3)"
elseif VERSION >= v"1.6.0-DEV.78"
@test sprint(show, sparse(reshape(1:9,3,:))) == "\n 1  4  7\n 2  5  8\n 3  6  9"
end

end # module test_stdlib_sparsearrays
