module test_julia_strings

using Test
using Jive

@If VERSION >= v"1.5.0-DEV.639" begin
@test contains("ppl").(["apple", "banana"]) == [true, false]
end

@If VERSION >= v"1.6.0-DEV.63" begin
x = "abc"
@test view(x, 1:2) isa SubString
end

end # module test_julia_strings
