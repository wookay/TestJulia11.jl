module test_julia_modules

using Test

if VERSION >= v"1.8.0-DEV.8"
@test isdefined(Module(:anonymous, false, true), :Core)
@test !isdefined(Module(:anonymous, false, false), :Core)
end

end # module test_julia_modules


module test_julia_modules_property

using Test

module M
v = 1
end # module M

@test getproperty(M, :v) == 1

if VERSION >= v"1.9.0-DEV.187"
    setproperty!(M, :v, 2)
    @test getproperty(M, :v) == 2

    setglobal!(M, :v, 3)
    getglobal(M, :v) == 3
end

end # module test_julia_modules_property
