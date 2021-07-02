using Jive
@If VERSION >= v"1.8.0-DEV.118" module test_julia_syntax

using Test

(a, f()...) = (1, 2, 3)
@test f() == (2, 3) 

(a, b, f()...) = (1, 2, 3)
@test f() == (3,) 

(a, b, c, f()...) = (1, 2, 3)
@test f() == () 

end # module test_julia_syntax
