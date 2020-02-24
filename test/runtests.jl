using Jive
julia13skip = ["pkgs/irtools", "pkgs/diffeqflux"]
VERSION <= v"1.2" && push!(julia13skip, "julia/unary")
VERSION >= v"1.4-DEV" && push!(julia13skip, "pkgs/zygote")
VERSION < v"1.4.0-DEV.599" && push!(julia13skip, "julia/abstractarray.jl")
VERSION < v"1.5.0-DEV.302" && push!(julia13skip, "julia/operators_bbsemi.jl")
haskey(ENV, "TRAVIS") && push!(julia13skip, "pkgs/poirot")
runtests(@__DIR__, skip=[julia13skip..., "revise.jl"])
!isempty(julia13skip) && printstyled("skipped julia 1.3: ", join(julia13skip, ", "), "\n", color=:yellow)
!isempty(Jive.Skipped.expressions) && printstyled("skipped tests: ", join(Jive.Skipped.expressions, ", "), "\n", color=:yellow)
