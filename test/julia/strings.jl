module test_julia_strings

using Test

if VERSION >= v"1.5.0-DEV.639"
@test contains("ppl").(["apple", "banana"]) == [true, false]
end

if VERSION >= v"1.6.0-DEV.63"
x = "abc"
@test view(x, 1:2) == "ab"
@test view(x, 1:2) isa SubString
end

if VERSION >= v"1.7.0-DEV.1286"
@test replace("abc", "a" => "b", "b" => "a") == "bac"
end

end # module test_julia_strings


using Jive
@If VERSION >= v"1.11.0-DEV.704" module test_julia_annotated

using Test

as = Base.annotatedstring("Hello World")
@test isempty(Base.annotations(as))

Base.annotate!(as, :a => 1)
@test Base.annotations(as) == [(1:11, :a => 1)]

end # @If VERSION >= v"1.11.0-DEV.704" module test_julia_annotated
