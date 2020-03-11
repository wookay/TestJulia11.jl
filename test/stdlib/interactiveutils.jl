using  Jive
@If VERSION >= v"1.5.0-DEV.205" module test_stdlib_interactiveutils

using Test
using InteractiveUtils

@test supertypes(typeof(+)) == (typeof(+), Function, Any)
@test supertypes(Cfloat) == (Float32, AbstractFloat, Real, Number, Any)

end # module test_stdlib_interactiveutils
