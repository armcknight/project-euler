require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 10: find sum of all primes under 2,000,000 (142913828922)
    def problem10
        sum(primesUpto(2000000))
    end
    
end