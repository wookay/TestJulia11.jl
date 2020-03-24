using Jive
@If VERSION >= v"1.5.0-DEV.215" module test_julia_namedtuple_215

using Test

@test (;) == NamedTuple()

end # module test_julia_namedtuple_215


@If VERSION >= v"1.5.0-DEV.499" module test_julia_namedtuple_499

using Test

x = 0
@test (; x) == (; x=0)

end # module test_julia_namedtuple_499
