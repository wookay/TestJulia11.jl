module test_julia_indices

using Test

if VERSION >= v"1.8.0-DEV.120"
@test Base.checked_length(1:3:5) == length(1:3:5) == 2
end

end # module test_julia_indices
