using Jive
@If VERSION < v"1.2.0-DEV" module test_pkgs_irtools_ir

using Test
using IRTools # code_ir

ir = IRTools.code_ir(+, Tuple{Int, Int})
@test ir isa IRTools.IR
@test sprint(show, ir) == """1:
  %1 = (Base.add_int)(_2, _3)
  return %1
"""

end # module test_pkgs_irtools_ir
