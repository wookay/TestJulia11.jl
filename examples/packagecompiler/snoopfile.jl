include(normpath(@__DIR__, "hello.jl"))
using .Hello; Hello.julia_main(String[])
