module test_julia_multidimensional_arrays

using Test

@test [1; 2; 3; 4] isa Array{Int, 1}

if VERSION >= v"1.7.0-DEV.1129"
@test [1;; 2;; 3;; 4] isa Array{Int, 2}
@test [1;;; 2;;; 3;;; 4] isa Array{Int, 3}
end # if VERSION >= v"1.7.0-DEV.1129"

end # module test_julia_multidimensional_arrays
