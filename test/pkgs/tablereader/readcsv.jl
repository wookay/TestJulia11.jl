module test_pkgs_tablereader

using TableReader
using Test

buffer = IOBuffer("""
col1,col2,col3
1,23,456
-10,-99,0
""")
df = readcsv(buffer)
@test df[:col3] == [456, 0]
@test collect(df[1,:]) == [1,23,456]

end # module test_pkgs_tablereader
