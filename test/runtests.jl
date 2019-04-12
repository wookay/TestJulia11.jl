using Jive
julia13skip = ["pkgs/irtools", "pkgs/zygote"]
runtests(@__DIR__, skip=[julia13skip..., "revise.jl"])
!isempty(julia13skip) && printstyled("skipped julia 1.3: ", join(julia13skip, ", "), "\n", color=:yellow)
!isempty(Jive.Skipped.expressions) && printstyled("skipped tests: ", join(Jive.Skipped.expressions, ", "), "\n", color=:yellow)
