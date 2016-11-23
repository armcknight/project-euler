require "./mathematics_functions"
require "./language"
include Mathematics
include Language

module ProjectEuler

    # 36: find all numbers under 1,000,000 who are palindromes in base 10 and 2 (872187)
    def problem36
        sum = 0
        1.upto(999999) do |x|
            sum += x if isPalindrome(x) && isPalindrome(decToBin(x))
        end
        sum
    end
    
end