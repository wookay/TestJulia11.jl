module test_julia_modules

using Test

if VERSION >= v"1.8.0-DEV.8"
@test isdefined(Module(:anonymous, false, true), :Core)
@test !isdefined(Module(:anonymous, false, false), :Core)
end

end # module test_julia_modules
