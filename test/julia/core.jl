module test_julia_core_setglobal

using Test

if VERSION >= v"1.9-DEV"
# Note: Julia 1.9 and 1.10 inadvertently omitted this error check (#56933).
# Hint: Declare it using `global n` inside `test_julia_core_setglobal` before attempting assignment.
global n

md = @__MODULE__
setglobal!(md, :n, 2)
@test @isdefined(n)
@test getglobal(md, :n) == n
end

end # module test_julia_core_setglobal
