module test_julia_world_counter

using Test

world1 = Int(Base.get_world_counter())

struct S
end

world2 = Int(Base.get_world_counter())
@test world2 > world1

end # module test_julia_world_counter


using Jive
@If VERSION >= v"1.12" module test_julia_check_world_bounded

using Test

world1 = Int(Base.get_world_counter())

struct A
end

world2 = Int(Base.get_world_counter())

a = A()
world3 = Base.check_world_bounded(typeof(a).name)
@test world3 === nothing

struct A
second
end

partition = Base.check_world_bounded(typeof(a).name)
@test !(world1 in partition)
@test world2 in partition

end # module test_julia_check_world_bounded
