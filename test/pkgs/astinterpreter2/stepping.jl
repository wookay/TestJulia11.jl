module test_pkgs_astinterpreter2

using Test
using ASTInterpreter2
using ASTInterpreter2: enter_call_expr
using DebuggerFramework
using DebuggerFramework: execute_command
using Base.Meta # isexpr

function CallTest()
    UnitRange{Int64}(2,2)
end

function step_through(frame)
    state = DebuggerFramework.dummy_state([frame])
    while !isexpr(ASTInterpreter2.pc_expr(state.stack[end]), :return)
        execute_command(state, state.stack[1], Val{:s}(), "s")
    end
    return ASTInterpreter2.lookup_var_if_var(state.stack[end], ASTInterpreter2.pc_expr(state.stack[end]).args[1])
end

@test step_through(ASTInterpreter2.enter_call_expr(:($(+)(1,2)))) == 3

end # module test_pkgs_astinterpreter2
