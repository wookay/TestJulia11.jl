using Jive
@If VERSION >= v"1.3.0-DEV" module test_julia_call

using Test

# Julia PR #31916

abstract type A end

struct B <: A
end

struct C <: A
end

struct D
end

(::A)() = 2

@test B()() == 2
@test C()() == 2
@test_throws MethodError D()()

(::Union{C,D})() = 5

@test B()() == 2
@test C()() == 5
@test D()() == 5

end
