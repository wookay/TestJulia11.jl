# @If VERSION >= v"1.6.0-DEV.1157"
module test_julia_import_as

using Test

module A
read() = true
end

import .A: read as f

@test f()

end # module test_julia_import_as
