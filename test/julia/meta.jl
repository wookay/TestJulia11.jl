module test_julia_meta

using Test

Meta.isexpr

if VERSION >= v"1.6.0-DEV.1402"
Meta.isidentifier
Meta.isoperator
Meta.isunaryoperator
Meta.isbinaryoperator
Meta.ispostfixoperator
end

end # module test_julia_meta
