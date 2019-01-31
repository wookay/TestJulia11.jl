module test_pkgs_astinterpreter2

using Test
using ASTInterpreter2

# https://github.com/JuliaDebug/ASTInterpreter2.jl/blob/master/test/utils.jl#L6
using Base.Meta: isexpr
using ASTInterpreter2: JuliaStackFrame
using ASTInterpreter2: pc_expr, plain, evaluate_call!, finish_and_return!, @eval_rhs
using DebuggerFramework
using DebuggerFramework: execute_command

# Steps through the whole expression using `s`
function step_through(frame)
    state = DebuggerFramework.dummy_state([frame])
    while !isexpr(plain(pc_expr(state.stack[end])), :return)
        execute_command(state, state.stack[1], Val{:s}(), "s")
    end
    lastframe = state.stack[end]
    return @eval_rhs(true, lastframe, plain(pc_expr(lastframe)).args[1], lastframe.pc[])
end

@test step_through(ASTInterpreter2.enter_call_expr(:($(+)(1,2.5)))) == 3.5

end # module test_pkgs_astinterpreter2
