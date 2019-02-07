using Jive
@If VERSION >= v"1.2.0-DEV.272" module test_julia_reflection

using Test

struct G
    field
end
@test Base.hasfield(G, :field)

using LinearAlgebra
A = [4 3; 6 3]
@test Base.hasproperty(lu(A), :L)

end
