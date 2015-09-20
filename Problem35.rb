require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 35: count circular primes (primes whose digit rotations--e.g 123, 231, 312--are all prime) under 1,000,000 (55)
    def problem35
        circulars = 0
        2.upto(1000000) do |x|
            if isCircularPrime x
                circulars += 1
            end
        end
        
        circulars
    end
    
end