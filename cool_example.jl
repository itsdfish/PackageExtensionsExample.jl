# Distributions package is not installed with PackageExtensionsExample,
# therefore it must be available in your path for this example to be run

# Important: load it first for the package extension to be loaded
using Distributions 

using PackageExtensionsExample

@assert length(methods(cool_function)) == 1

cool_function()
# should pring "calling cool_function()"