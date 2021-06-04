module test_julia_hash

using Test

if VERSION >= v"1.7.0-DEV.1233"
@test hash(:x) === objectid(:x)
end # if VERSION >= v"1.7.0-DEV.1233"

end # module test_julia_hash
