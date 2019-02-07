module test_pkgs_irtools_ir

using Test
using IRTools

ir = @code_ir 1+2
@test ir isa IRTools.IR
@test sprint(show, ir) == """1:
  %1 = (Base.add_int)(_2, _3)
  return %1
"""

end # module test_pkgs_irtools_ir
