module DistributionsExt

    using PackageExtensionsExample
    import PackageExtensionsExample: cool_function
    import Distributions: logpdf

    function logpdf(d::MyType)
        println("calling logpdf(d::MyType)")
    end

    function cool_function()
        println("calling cool_function()")
    end

end
