require "./mathematics_classes"
include Mathematics

# 41: What is the largest n-digit pandigital (uses all digits in [1,n] exactly once) prime that exists? (7652413)
def problem41
    max = 0
    1.upto(9) do |n|
        (1..n).to_a.permutation.to_a.each do |x|
            test = x.join.to_i
            max = test if isPrime(test) && test > max
        end
    end
    max
end