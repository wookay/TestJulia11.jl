module test_pkgs_plutoui_with_terminal

using Test
using PlutoUI

output = with_terminal() do
    println("hello")
end

@test PlutoUI.WithTerminalOutput("hello\n", "", nothing) == output

end # module test_pkgs_plutoui_with_terminal
