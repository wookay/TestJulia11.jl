using  Jive
@If VERSION >= v"1.4.0-DEV.599" module test_julia_abstractarray_begin_end

using Test

@test (1:3)[begin:end] == 1:3
@test "abc"[begin:end] == "abc"

A = [5,6,7]
@test getindex(A, 1) == 5
@test firstindex(A) == 1
@test lastindex(A) == 3

end # module test_julia_abstractarray_begin_end


@If VERSION >= v"1.9.0-DEV.1163" module test_julia_abstractarray_stack

using Test

@test stack((1:3, 5:7)) == [1 5;
                            2 6;
                            3 7]
@test stack((1:3, 5:7), dims=1) == [1 2 3;
                                    5 6 7]

end # test_julia_abstractarray_stack
