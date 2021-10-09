@enum 과일 사과 오렌지 키위

using Jive
@If VERSION >= v"1.2.0-DEV.336" module test_julia_enum

const 과일 = parentmodule(test_julia_enum).과일
using Test

@test instances(과일)[1] isa 과일

@enum Fruit apple orange kiwi
@test sprint(show, instances(Fruit)) == "($(@__MODULE__).apple, $(@__MODULE__).orange, $(@__MODULE__).kiwi)"

end # module test_julia_enum
