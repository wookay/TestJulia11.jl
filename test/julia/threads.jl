# JULIA_NUM_THREADS=2 julia threads.jl
module test_julia_threads

using Test

@test 1 <= Threads.nthreads() <= Sys.CPU_THREADS

A = fill((0, 0), (9,9))
n = 1

Threads.@threads for i in 2:9
    Threads.@threads for j in 1:9
        global n
        tid = Threads.threadid()
        A[i, j] = (tid, n)
        n += 1
    end
end

# @info :A A
#=
┌ Info: A
│   A =
│    9×9 Array{Tuple{Int64,Int64},2}:
│     (0, 0)   (0, 0)   (0, 0)   (0, 0)   (0, 0)   (0, 0)   (0, 0)   (0, 0)   (0, 0)
│     (1, 1)   (1, 2)   (1, 3)   (1, 4)   (1, 6)   (1, 8)   (1, 10)  (1, 12)  (1, 14)
│     (1, 18)  (1, 20)  (1, 22)  (1, 24)  (1, 26)  (1, 28)  (1, 30)  (1, 32)  (1, 34)
│     (1, 36)  (1, 38)  (1, 40)  (1, 42)  (1, 44)  (1, 46)  (1, 48)  (1, 50)  (1, 52)
│     (1, 54)  (1, 57)  (1, 59)  (1, 61)  (1, 63)  (1, 65)  (1, 67)  (1, 69)  (1, 71)
│     (2, 1)   (2, 3)   (2, 5)   (2, 7)   (2, 9)   (2, 11)  (2, 13)  (2, 15)  (2, 17)
│     (2, 18)  (2, 19)  (2, 21)  (2, 23)  (2, 25)  (2, 27)  (2, 29)  (2, 31)  (2, 33)
│     (2, 35)  (2, 37)  (2, 39)  (2, 41)  (2, 43)  (2, 45)  (2, 47)  (2, 49)  (2, 51)
└     (2, 53)  (2, 55)  (2, 56)  (2, 58)  (2, 60)  (2, 62)  (2, 64)  (2, 66)  (2, 68)
=#

end # module test_julia_threads
