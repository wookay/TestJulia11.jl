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
@test b == 2

end # module test_julia_property_destructuring



@If VERSION >= v"1.7.0-DEV.579" module test_julia_property_destructuring_type_annotations

using Test

struct X
    c
    d
end

let c, d
(; d::Int, c::String) = X("a", 2.0)

@test c == "a"
@test d isa Int
end

end #module test_julia_property_destructuring_type_annotations


@If VERSION >= v"1.7" module test_julia_namedtuples_error

using Test

a = 1
if VERSION >= v"1.12-beta"
@test_throws FieldError(@NamedTuple{a::Int64}, :b)            (; b) = (; a)
else
@test_throws ErrorException("type NamedTuple has no field b") (; b) = (; a)
end

end # module test_julia_namedtuples_error
