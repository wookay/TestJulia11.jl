module test_pkgs_macrotools_expand

using Test
using MacroTools

expr = MacroTools.@expand(@test true)

prettify(expr)

Meta.eval(expr)

end # module test_pkgs_macrotools_expand
