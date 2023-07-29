using Documenter
using PackageExtensionsExample

makedocs(
    sitename = "PackageExtensionsExample",
    format = Documenter.HTML(),
    modules = [PackageExtensionsExample]
)

# Documenter can also automatically deploy documentation to gh-pages.
# See "Hosting Documentation" and deploydocs() in the Documenter manual
# for more information.
#=deploydocs(
    repo = "<repository url>"
)=#
