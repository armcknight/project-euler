require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 41: What is the largest n-digit pandigital (uses all digits in [1,n] exactly once) prime that exists? (7652413)
    def problem41
        max = 0
        1.upto(9) do |n|
            (1..n).to_a.permutation.to_a.each do |x|
                next if x[-1] % 2 == 0
                next if x.reduce(:+) % 3 == 0
                test = x.join.to_i
                next if max >= test
                next if !isPrime(test)
                max = test
                return max if max > 8000000
            end
        end
        max
    end
    
end