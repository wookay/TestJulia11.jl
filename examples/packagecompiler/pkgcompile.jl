using PackageCompiler

packages = (:Flux, :Zygote, :Images, )
blacklist = [:Distributed]
PackageCompiler.compile_incremental(packages..., blacklist=blacklist)

# julia -J ~/.julia/dev/PackageCompiler/sysimg/sys.dylib
