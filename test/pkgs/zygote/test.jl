using Jive
@If VERSION < v"1.2.0-DEV" module test_pkgs_zygote

using Test
using Zygote

f(x) = sin(x) + 1
@test f' isa Function
@test f'(1) == 0.5403023058681398

g(x) = cos(x) + 1
@test g'(1) == -0.8414709848078965
@test (f ∘ g)'(1) == -0.02565585722112011
@test f'(g(1)) * g'(1) == (f ∘ g)'(1)

end # module test_pkgs_zygote
