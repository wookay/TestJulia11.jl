using Jive
@If VERSION >= v"1.1.0-DEV.792" module test_julia_array_eachrow

using Test

A = [1 2;
     3 4;
     5 6]
@test collect(eachrow(A)) == [[1, 2], [3, 4], [5, 6]]
@test collect(eachcol(A)) == [[1, 3, 5], [2, 4, 6]]

end # @If VERSION >= v"1.1.0-DEV.792" module test_julia_array_eachrow
