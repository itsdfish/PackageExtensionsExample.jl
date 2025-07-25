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

    # this installs exported symbols such as MyExtType to the parent module
    function __init__()
        Core.eval(PackageExtensionsExample, 
        quote
            @info("Exporting symbols from DistributionsExt to PackageExtensionsExample")
            ext = Base.get_extension(PackageExtensionsExample, :DistributionsExt)
            using .ext
        end)
    end
end
