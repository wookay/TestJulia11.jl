using Jive
@useinside Main module test_unicodeplots_lineplot

using Test
using UnicodePlots

const PathString = String
const EXIT_CODE_SUCCESS = 0

function git_diff(lhs::AbstractString, rhs::AbstractString)
    dir::PathString = tempdir()::PathString
    old::PathString = normpath(dir, "old")
    write(old, lhs)
    new::PathString = normpath(dir, "new")
    write(new, rhs)
    cmd = Cmd(["git", "--no-pager", "diff", "--no-index", "--color-words", old, new])
    # @info cmd
    procs = open(cmd, "r", devnull)
    bytes = read(procs.out)
    (exitcode = procs.exitcode, output = String(bytes))
end

p = lineplot([0.0, 1.0], [0.0, 1.0]; head_tail = :head, name = "head", color = :red)

#   write(normpath(@__DIR__, "output-1.txt"), string(p))
s1 = read(normpath(@__DIR__, "output-1.txt"), String)
@test string(p) == s1

@test (; exitcode = EXIT_CODE_SUCCESS, output = "") == git_diff(string(p), s1)

end # module test_unicodeplots_lineplot
