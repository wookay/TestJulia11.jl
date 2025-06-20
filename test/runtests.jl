using Jive
skip_tests = map(dir -> "pkgs/$dir", split("debugger irtools plutoui diffeqflux macrotools poirot zygote"))

VERSION < v"1.6.0-DEV.1157" && push!(skip_tests, "julia/import_as.jl")
VERSION < v"1.8" && push!(skip_tests, "julia/core_const_setfield.jl")
VERSION < v"1.11" && push!(skip_tests, "julia/syntax_public.jl")

runtests(@__DIR__, skip=skip_tests)
!isempty(Jive.Skipped.expressions) && printstyled("skipped tests: ", join(Jive.Skipped.expressions, ", "), "\n", color=:yellow)
