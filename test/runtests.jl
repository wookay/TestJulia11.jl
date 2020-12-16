using Jive
skip_tests = ["pkgs"]

VERSION < v"1.6.0-DEV.1157" && push!(skip_tests, "julia/import_as.jl")

runtests(@__DIR__, skip=skip_tests)
!isempty(Jive.Skipped.expressions) && printstyled("skipped tests: ", join(Jive.Skipped.expressions, ", "), "\n", color=:yellow)
