module Hello

function main()
    println("hello world")
end

Base.@ccallable function julia_main(ARGS::Vector{String})::Cint
    main()
    return 0
end

end # module Hello
