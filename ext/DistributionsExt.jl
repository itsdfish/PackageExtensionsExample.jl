module DistributionsExt

    using PackageExtensionsExample
    using StatsBase
    import PackageExtensionsExample: cool_function
    import Distributions: logpdf


    function logpdf(d::MyType)
        println("calling logpdf(d::MyType)")
        return AnalyticWeights([0.2, 0.1, 0.3])
    end

    function cool_function()
        println("calling cool_function()")
    end

end
