module test_julia_core_setglobal

using Test

if VERSION >= v"1.9-DEV"
md = @__MODULE__
setglobal!(md, :n, 2)
@test @isdefined(n)
@test getglobal(md, :n) == n
end

end # module test_julia_core_setglobal
