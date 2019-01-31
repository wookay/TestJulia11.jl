module test_pkgs_zygote

using Test
using Zygote

f(x) = sin(x) + 1
@test f' isa Function
@test f'(1) == 0.5403023058681398

end # module test_pkgs_zygote
