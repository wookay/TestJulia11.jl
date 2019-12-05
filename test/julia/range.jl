module test_julia_range_steprange

using Test

@test collect(0:1//4:1) == [0//1, 1//4, 1//2, 3//4, 1//1]

end # module test_julia_range_steprange


using Jive
@If VERSION >= v"1.3.0-alpha.47" module test_julia_range_dates

using Test
using Dates

@test intersect(Date(2020, 1, 1):Day(1):Date(2020, 1, 5), Date(2020, 1, 3):Day(1):Date(2020, 1, 8)) == Date(2020, 1, 3):Day(1):Date(2020, 1, 5)

end # module test_julia_range_dates
