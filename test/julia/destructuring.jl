using Jive
# type annotations in property destructuring
@If VERSION >= v"1.7.0-DEV.579" module test_julia_destructuring

using Test

r = 1//2
(; num, den) = r
@test num == 1
@test den == 2
f((; num)::Rational) = num
@test 1 == f(r)

end # module test_julia_destructuring
