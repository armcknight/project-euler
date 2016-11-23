require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 27: Considering quadratics of the form n^2 + an + b, where |a| < 1000 and |b| < 1000, find the product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n, starting with n = 0. (-59231)
    def problem27
        maxValues = 0
        product = 0
        (-999).upto(999) do |a|
            (-999).upto(999) do |b|
                n, quad = 0, 0
                n += 1 while ((quad = n**2 + a * n + b) > 1 ? isPrime(quad) : false)
                if (n - 1) > maxValues
                    maxValues = (n - 1)
                    product = a * b
                end
            end
        end
        product
    end
    
end