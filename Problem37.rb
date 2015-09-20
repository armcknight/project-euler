require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 37: find the sum of the only eleven primes (with more than 1 digit) that are both truncatable from left to right and right to left (748317)
    def problem37
        count = 0
        n = 11
        sum = 0
        while count < 11
            if isPrime(n) && isRightTruncatablePrime(n) && isLeftTruncatablePrime(n)
                sum += n
                count += 1
                puts "#{count}: adding #{n}; sum = #{sum}"
            end
            n += 1
        end
    end
    
end