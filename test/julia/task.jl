using Jive
@If VERSION >= v"1.3.0-alpha.110" module test_julia_task

using Test

@test_throws TaskFailedException (t = @async rand(2)[3]; wait(t))

end # @If VERSION >= v"1.3.0-alpha.110" module test_julia_task
