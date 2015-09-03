require "./mathematics_classes"
include Mathematics

# 23: find sum of numbers that can't be formed by adding two abundant numbers (4179871)
def problem23
    upperBound = 28123 # (it can be analytically shown that all numbers > 28123 can be formed by the sum of two abundant numbers)
    abundants = abundantsTo upperBound
    abundantSums = Array.new
    abundants.size.times{|i| abundantSums << abundants[0..-(i+1)].map {|j| abundants[i] + j}}
    sortedUnique = abundantSums.flatten.uniq.sort
    sum((1..upperBound).select{|i|!sortedUnique.include?(i)})
end