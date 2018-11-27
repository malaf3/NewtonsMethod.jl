module NewtonsMethod

greet() = print("Hello World!")

using LinearAlgebra, ForwardDiff

function fixedpointmap(f, f_prime, x_0, tolerance, maxiter)
    normdiff = Inf
    iter = 1
    while normdiff > tolerance && iter <= maxiter
        x_new =x_0 - (f(x_0)/f_prime(x_0)) 
        normdiff = norm(x_new - x_0)
        x_0 = x_new
        iter = iter + 1
    end
    return (x_0, normdiff, iter)
end

using ForwardDiff
function fixedpointmap(f, x_0, tolerance, maxiter)
    normdiff = Inf
    iter = 1
    D(f) = x -> ForwardDiff.derivative(f, x)
    fprime= D(f)
    while normdiff > tolerance && iter <= maxiter
        x_n =x_0-  (f(x_0)/fprime(x_0)) 
        normdiff = norm(x_n - x_0)
        x_0 = x_n
        iter = iter + 1
    end
    return (x_0, normdiff, iter)
end

end # module
