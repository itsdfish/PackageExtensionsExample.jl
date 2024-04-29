cd(@__DIR__)
using Pkg
# run Pkg.instantiate() the first time you run this code
Pkg.activate("")
using PackageExtensionsExample
# cool function should have no methods until Distributions is loaded 
@assert length(methods(cool_function)) == 0

using Distributions 
# cool function should have 1 method now that Distributions is loaded 
@assert length(methods(cool_function)) == 1

cool_function()
# should print "calling cool_function()"