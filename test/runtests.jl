using PackageExtensionsExample
using Test


@testset "zero methods" begin
    @test length(methods(cool_function)) == 0
end

@testset "one method" begin
    using Distributions
    @test length(methods(cool_function)) == 1
end
