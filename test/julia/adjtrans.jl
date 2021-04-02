module test_julia_adjtrans

using Test

A = [2im -3im 4im
     5im  6im 7im]
@test A' == [-2im -5im
              3im -6im
             -4im -7im] == adjoint(A)

# if VERSION >= v"1.6.0-DEV.1471"
# B = [2 3 4
#      5 6 7]
# @test B'ᵀ == [2 5
#               3 6
#               4 7] == transpose(B)
# end

end # module test_julia_adjtrans
