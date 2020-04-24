module test_julia_strings

using Test
using Jive

@If VERSION >= v"1.5.0-DEV.639" begin

@test contains("ppl").(["apple", "banana"]) == [true, false]

end

end # module test_julia_strings
