using Jive
@If VERSION >= v"1.3.0-alpha.47" module test_julia_range

using Test
using Dates

@test intersect(Date(2020, 1, 1):Day(1):Date(2020, 1, 5), Date(2020, 1, 3):Day(1):Date(2020, 1, 8)) == Date(2020, 1, 3):Day(1):Date(2020, 1, 5)

end # module test_julia_range
