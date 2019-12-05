using Jive
@useinside module test_pkgs_poirot_bernoulli

using Test
using Poirot

coin() = rand(Bool)
@test infer(() -> coin()) == Bernoulli{Rational{Int64}}(1//2)

end # module test_pkgs_poirot_bernoulli
