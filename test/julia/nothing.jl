module test_julia_cmd_nothing

using Test

@test_throws ArgumentError `$nothing`

end # module test_julia_cmd_nothing


using Jive
@If VERSION >= v"1.3.0-alpha.62" module test_julia_print_nothing

using Test

@test sprint(print, nothing) == "nothing"

end # module test_julia_print_nothing
