using Jive
@If VERSION >= v"1.3.0-DEV.417" module test_stdlib_dates

using Test
using Dates

@test DateTime("2019-03-22 12:01 AM", dateformat"yyyy-mm-dd II:MM p") < DateTime("2019-03-22 01:01 AM", dateformat"yyyy-mm-dd II:MM p")

df = DateFormat("u dd, yyyy HH:MM:SS p")

dt = parse(DateTime, "Dec 20, 2019 6:37:10 AM", df)
@test dt == DateTime(2019, 12, 20, 6, 37, 10)

dt = parse(DateTime, "Dec 20, 2019 6:37:10 PM", df)
@test dt == DateTime(2019, 12, 20, 18, 37, 10)

@test Dates.format(Time(Nanosecond(Minute(62))), "HH:MM") == "01:02"

end # module test_stdlib_dates
