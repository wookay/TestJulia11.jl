module test_julia_random

using Test

x = rand(UInt8, 5)
y = rand(UInt8, 5)
@test x isa Vector{UInt8}
@test x != y

if VERSION >= v"1.11"
    using Random
    dev = RandomDevice()
    x = rand(dev, NTuple{5, UInt8})
    y = rand(dev, NTuple{5, UInt8})
    @test x isa NTuple{5, UInt8}
    @test x != y
end

end # module test_julia_random
