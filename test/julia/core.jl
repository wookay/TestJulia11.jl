module test_julia_core_setglobal

using Test

if VERSION >= v"1.9-DEV"
# Note: Julia 1.9 and 1.10 inadvertently omitted this error check (#56933).
# Hint: Declare it using `global n` inside `test_julia_core_setglobal` before attempting assignment.
global n

md = @__MODULE__
setglobal!(md, :n, 2)
@test @isdefined(n)
@test getglobal(md, :n) == n
end

end # module test_julia_core_setglobal


# doc/src/devdocs/ast.md
"""
  * Timing fields

    - `time_infer_total`: Total cost of computing `inferred` originally as wall-time from start to finish.

    - `time_infer_cache_saved`: The cost saved from `time_infer_total` by having caching.
      Adding this to `time_infer_total` should give a stable estimate for comparing the cost
      of two implementations or one implementation over time. This is generally an
      over-estimate of the time to infer something, since the cache is frequently effective
      at handling repeated work.

    - `time_infer_self`: Self cost of julia inference for `inferred` (a portion of
      `time_infer_total`). This is simply the incremental cost of compiling this one method,
      if given a fully populated cache of all call targets, even including constant
      inference results and LimitedAccuracy results, which generally are not in a cache.

    - `time_compile`: Self cost of llvm JIT compilation (e.g. of computing `invoke` from
      `inferred`). A total cost estimate can be computed by walking all of the `edges`
      contents and summing those, while accounting for cycles and duplicates. (This field
      currently does not include any measured AOT compile times.)
"""
module test_julia_core_timing_fields

using InteractiveUtils
using Test

if VERSION >= v"1.13.0-DEV.242"

w::Core.Method = which(÷, (Int32, UInt16))
mi::Core.MethodInstance = w.specializations[6]
@test !isdefined(mi, :cache)

code_native(devnull, ÷, dump_module=false, (Int32, UInt16))
b::Core.CodeInstance = mi.cache

# these time fields have units of seconds
# (60 ns minimum resolution and 18 hour maximum saturates to Infinity)
# and are stored in Float16 format
#    uint16_t time_infer_total;       // total cost of computing `inferred` originally
#    uint16_t time_infer_cache_saved; // adjustment to total cost,
#                                        reflecting how much time was saved by having caches,
#                                        to give a stable real cost without caches for comparisons
#    uint16_t time_infer_self;        // self cost of julia inference for `inferred` (included in time_infer_total)
#    _Atomic(uint16_t) time_compile;  // self cost of llvm compilation (e.g. of computing `invoke`)
time_infer_total       = reinterpret(Float16, b.time_infer_total)
time_infer_cache_saved = reinterpret(Float16, b.time_infer_cache_saved)
time_infer_self        = reinterpret(Float16, b.time_infer_self)
time_compile           = reinterpret(Float16, b.time_compile)

end

end # module test_julia_core_timing_fields


module test_julia_core_nospecialize

using Test

f(x) = 42
f(0)
f(pi)
@test only(methods(f)).specializations isa Core.SimpleVector

fnosp(@nospecialize(x)) = 42
fnosp(0)
fnosp(pi)
@test only(methods(fnosp)).specializations isa Core.MethodInstance

end # module test_julia_core_nospecialize
