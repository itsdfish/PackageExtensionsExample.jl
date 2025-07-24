#=
You should be able run this script from any directory with any project settings.
=#

using Pkg

cd(@__DIR__)

# activates the project in the script's directory
Pkg.activate(".")

# adds the local PackageExtensionsExample package to the script project (don't use Pkg.add here)
Pkg.develop(path="../")

using PackageExtensionsExample

# cool function should have no methods until Distributions is loaded 
@assert length(methods(cool_function)) == 0

try
   cool_function()
catch e
   @assert e isa MethodError
end

# calling @cool_macro here throws a LoadError at the module level
# @cool_macro

using Distributions 
# cool function should have 1 method now that Distributions is loaded 
@assert length(methods(cool_function)) == 1

cool_function()
# should print "calling cool_function()"

@cool_macro
# should print "calling cool_macro()"
