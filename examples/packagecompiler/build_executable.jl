using PackageCompiler

jlfile = normpath(@__DIR__, "hello.jl")
snoopfile = ""
relativebuilddir = "build"
build_executable(jlfile, snoopfile = snoopfile, builddir = relativebuilddir, verbose = true)
