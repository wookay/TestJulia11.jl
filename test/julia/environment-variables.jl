module test_julia_environment_variables

using Test

julia_bin = joinpath(Sys.BINDIR, Base.julia_exename())

empty_depot_path = read(setenv(`$julia_bin -e 'println(Base.DEPOT_PATH)'`, Dict("JULIA_DEPOT_PATH"=>"")), String)
if VERSION >= v"1.3.0-DEV"
    @test empty_depot_path == "String[]\n"
end

end # module test_julia_environment_variables
