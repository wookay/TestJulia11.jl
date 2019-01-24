module test_pkgs_diffeqflux_neural_de

using Test
using DiffEqFlux # diffeq_rd neural_ode neural_msde


using DiffEqFlux: destructure, restructure
using Flux # Chain Dense relu
model = Chain(Dense(10, 5, relu), Dense(5, 2))
p = destructure(model)
m2 = restructure(model, p)
@test string(model) == string(m2) == "Chain(Dense(10, 5, NNlib.relu), Dense(5, 2))"

end # module test_pkgs_diffeqflux_neural_de
