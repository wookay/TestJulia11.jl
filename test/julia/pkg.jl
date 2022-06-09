module test_julia_pkg

using Test
using Jive

if VERSION >= v"1.9.0-DEV.719"
@test pkgversion(Jive) >= v"0.2.25"
end

end # module test_julia_pkg
