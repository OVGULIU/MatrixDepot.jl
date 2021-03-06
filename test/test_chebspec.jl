n = 10 # rand(1:10)
# no null vector for 1-by-1 chebspec.
if n == 1
    n = 2
end
A = matrixdepot("chebspec", n)
# A has null vector ones(n)
@test A*ones(n) ≈ zeros(n) atol = 1e-6
B = matrixdepot("chebspec", n, 1)
# B's eigenvalues have negative real parts.
v = real(eigvals(B))
for i = 1:n
    @test v[i] < 0
end
println("'chebspec' passed test...")
