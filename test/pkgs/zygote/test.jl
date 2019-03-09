module test_pkgs_zygote_adjoint # '

using Test
using Zygote

f(x) = sin(x) + 1
@test f' isa Function
@test f'(1) == 0.5403023058681398

g(x) = cos(x) + 1
@test g'(1) == -0.8414709848078965
@test (f ∘ g)'(1) == -0.02565585722112011
@test f'(g(1)) * g'(1) == (f ∘ g)'(1)

end # module test_pkgs_zygote_adjoint


module test_pkgs_zygote_gradient

using Test
using Zygote

# http://fluxml.ai/Zygote.jl/dev/#Taking-Gradients-1

f(x) = 3x^2 + 2x + 1
@test gradient(f, 5) == (f'(5),)

y, back = Zygote.forward(f, 5)
@test y == 86
@test back(1) == (32,)

end # module test_pkgs_zygote_gradient


module test_pkgs_zygote_forwarddiff

using Test
using Zygote: gradient, forwarddiff

f(x) = 3x^2 + 2x + 1
@test gradient(5) do x
    forwarddiff(f, x)
end == (32,)

end # test_pkgs_zygote_forwarddiff
