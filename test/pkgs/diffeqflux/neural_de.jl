module test_pkgs_diffeqflux_neural_de

using Test
using DiffEqFlux: destructure, restructure
using Flux # Chain Dense relu

function Base.:(==)(a::Chain, b::Chain)
    all(prop -> getfield(a, prop) == getfield(b, prop), fieldnames(Chain))
end

function Base.:(==)(a::Dense, b::Dense)
    all(prop -> getfield(a, prop) == getfield(b, prop), fieldnames(Dense))
end

model = Chain(Dense(10, 5, relu), Dense(5, 2))
p = destructure(model)
m2 = restructure(model, p)
@test model == m2

end # module test_pkgs_diffeqflux_neural_de
