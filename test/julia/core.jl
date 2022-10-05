module test_julia_core

using Test

if VERSION >= v"1.9-DEV"
md = @__MODULE__
setglobal!(md, :n, 2)
@test getglobal(md, :n) == n
end

end # module test_julia_core
