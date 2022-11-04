# @If VERSION >= v"1.8"
module test_julia_core_const_setfield

using Test

@test_throws(ErrorException("invalid field attribute const for immutable struct"),
    struct ImmutableStruct
        const field
    end)

mutable struct MutableStruct
    const field
end

s = MutableStruct(1)
@test_throws(ErrorException("setfield!: const field .field of type MutableStruct cannot be changed"), s.field = 2)

end # module test_julia_core_const_setfield
