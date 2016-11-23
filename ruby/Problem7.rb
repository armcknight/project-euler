require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 7: find 10001st prime number (104743)
    def problem7
        primes = current = 1
        primes += 1 if isPrime (current += 2) until primes == 10001
        current
    end

end