module DistributionsExt

    isdefined(Base, :get_extension) ? (using Distributions) : (using ..Distributions)

    using PackageExtensionsExample
    import Distributions: logpdf

    function logpdf(d::MyType)
        println("calling logpdf(d::MyType))
    end

end
