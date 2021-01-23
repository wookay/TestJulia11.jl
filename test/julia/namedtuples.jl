using Jive
@If VERSION >= v"1.5.0-DEV.499" module test_julia_namedtuple_499

using Test

x = 0
@test (; x) == (; x=0)

struct S
    val
end

@test (; S(1).val) == (; val=1) == (val=1,)

f(; val) = val + 2
@test f(; S(1).val) == 3

end # module test_julia_namedtuple_499



@If VERSION >= v"1.7.0-DEV.364" module test_julia_property_destructuring

using Test

struct X
    a
    b
end

(; a, b) = X(1, 2)
@test a == 1
@info b == 2

end # module test_julia_property_destructuring
