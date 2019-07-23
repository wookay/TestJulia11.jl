using Jive
@If VERSION >= v"1.3.0-DEV.417" module test_stdlib_dates

using Test
using Dates

@test DateTime("2019-03-22 12:01 AM", dateformat"yyyy-mm-dd II:MM p") < DateTime("2019-03-22 01:01 AM", dateformat"yyyy-mm-dd II:MM p")

end # module test_stdlib_dates
