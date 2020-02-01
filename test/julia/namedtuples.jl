using Jive
@If VERSION >= v"1.5.0-DEV.215" module test_julia_namedtuple

using Test

@test (;) == NamedTuple()

end # module test_julia_namedtuple
