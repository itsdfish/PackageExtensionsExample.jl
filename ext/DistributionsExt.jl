module DistributionsExt

    using PackageExtensionsExample
    import Distributions: logpdf
    
    function logpdf(d::MyType)
        println("calling logpdf(d::MyType)")
    end

end
