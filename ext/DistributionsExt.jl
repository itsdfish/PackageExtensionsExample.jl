module DistributionsExt

    isdefined(Base, :get_extension) ? (using Distributions) : (using ..Distributions)

    using PackageExtensionsExample

    function cool_function()
        # a function that depends on Distributions
    end

end
