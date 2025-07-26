module DistributionsExt

    using PackageExtensionsExample
    using StatsBase
    import PackageExtensionsExample: cool_function, @cool_macro
    import Distributions: logpdf
    export MyExtType
    
    @kwdef struct MyExtType 
        msg = "hello from DistributionsExt"
    end


    function logpdf(d::MyType)
        println("calling logpdf(d::MyType)")
        return AnalyticWeights([0.2, 0.1, 0.3])
    end

    function cool_function()
        println("calling cool_function()")
    end

    macro cool_macro()
        :(println("calling cool_macro()"))
    end

    # this installs exported symbols such as MyExtType to the parent module. Using println instead of @info can save 300ms on compilation.
    function __init__()
        # The @spawn is a hack to work around the new mechanisms in Julia 1.11 (in 1.10 you don't need it). This is probably not 100% safe, not knowing if the module loading code being touched is thread safe. It shows what's happening until a better solution is found.
        Threads.@spawn begin
            sleep(0.001)
            Core.eval(PackageExtensionsExample, 
            quote
                println("Exporting symbols from DistributionsExt to PackageExtensionsExample")
                ext = Base.get_extension(PackageExtensionsExample, :DistributionsExt)
                using .ext
            end)
        end
    end
end
