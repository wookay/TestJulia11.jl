module test_pkgs_macrotools_expand

using MacroTools
using Test

expr = MacroTools.@expand(@test true)

prettify(expr)

Meta.eval(expr)

end # module test_pkgs_macrotools_expand
