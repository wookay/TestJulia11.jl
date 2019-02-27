module test_pkgs_debugger

# code from https://github.com/JuliaDebug/Debugger.jl/blob/master/test/utils.jl

using Test
using Debugger: DebuggerState, @enter, execute_command
using JuliaInterpreter: JuliaInterpreter, JuliaStackFrame, @lookup, pc_expr, enter_call_expr

dummy_state(stack) = DebuggerState(stack, nothing)

function step_through(frame)
    state = dummy_state([frame])
    while !Meta.isexpr(pc_expr(state.stack[end]), :return)
        execute_command(state, state.stack[1], Val{:s}(), "s")
    end
    lastframe = state.stack[end]
    return @lookup(lastframe, pc_expr(lastframe).args[1])
end

@test step_through(enter_call_expr(:($(+)(1,2)))) == 3

end # module test_pkgs_debugger
