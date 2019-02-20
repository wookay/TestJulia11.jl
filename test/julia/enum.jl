@enum 과일 사과 오렌지 키위

using Jive
@If VERSION >= v"1.2.0-DEV.336" module test_julia_enum

using Main: 과일
using Test

# Julia PR #30924
@test sprint(show, instances(과일)) == "(사과, 오렌지, 키위)"

@enum Fruit apple orange kiwi
@test sprint(show, instances(Fruit)) == "($(@__MODULE__).apple, $(@__MODULE__).orange, $(@__MODULE__).kiwi)"

end # module test_julia_enum
