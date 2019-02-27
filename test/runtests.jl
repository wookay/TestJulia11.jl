using Jive
julia12skip = VERSION >= v"1.2.0-DEV" ? ["pkgs/debugger", "pkgs/irtools"] : []
runtests(@__DIR__, skip=[julia12skip..., "revise.jl"])
!isempty(julia12skip) && printstyled("skipped julia 1.2: ", join(julia12skip, ", "), "\n", color=:yellow)
!isempty(Jive.Skipped.expressions) && printstyled("skipped tests: ", join(Jive.Skipped.expressions, ", "), "\n", color=:yellow)
