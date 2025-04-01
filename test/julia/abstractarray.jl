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


module test_julia_abstractarray_abstractoneto

using Test

two = Base.OneTo(2)
@test collect(two) == [1, 2]

if VERSION >= v"1.13.0-DEV.337"

# from julia/test/testhelpers/SizedArrays.jl
struct SOneTo{N} <: Base.AbstractOneTo{Int} end
SOneTo(N) = SOneTo{N}()
Base.length(::SOneTo{N}) where {N} = N
Base.size(r::SOneTo) = (length(r),)
Base.axes(r::SOneTo) = (r,)
Base.first(::SOneTo) = 1
Base.last(r::SOneTo) = length(r)
Base.show(io::IO, r::SOneTo) = print(io, "SOneTo(", length(r), ")")

dul = SOneTo(2)
@test collect(dul) == [1, 2]

struct 숫자세기{N} <: Base.AbstractOneTo{Int} end
숫자세기(N) = 숫자세기{N}()
Base.length(::숫자세기{N}) where {N} = N
Base.first(::숫자세기) = 1
Base.last(r::숫자세기) = length(r)

둘 = 숫자세기(2)
@test collect(둘) == [1, 2]
@test 둘 isa 숫자세기{2}

end

end # module test_julia_abstractarray_abstractoneto
