require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 3: find largest prime factor of 600851475143 (6857)
    def problem3
        primeFactors(600851475143)[-1]
    end

end