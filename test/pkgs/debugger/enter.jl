module test_pkgs_debugger

using Test
using Debugger
using JuliaInterpreter: enter_call_expr

# code from https://github.com/JuliaDebug/Debugger.jl/blob/master/test/utils.jl
dummy_state(frame) = Debugger.DebuggerState(; frame=frame)

# Steps through the whole expression using `s`
function step_through(frame)
    state = dummy_state(frame)
    while state.frame !== nothing
        Debugger.execute_command(state, Val{:s}(), "s")
    end
    return state.overall_result
end

@test step_through(enter_call_expr(:($(+)(1,2)))) == 3

end # module test_pkgs_debugger
