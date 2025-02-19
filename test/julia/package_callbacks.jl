module test_julia_package_callbacks

using Printf

global counter = 0

function callback(mod::Base.PkgId)
    global counter
    counter += 1
    println("package_callbacks: ", mod)
end
push!(Base.package_callbacks, callback)

using TOML
# Dates, TOML

pop!(Base.package_callbacks)

using Test
if VERSION >= v"1.11"
    @test counter == 2
end

end # module test_julia_package_callbacks
