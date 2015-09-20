require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 55: How many numbers below 10,000 will not produce a palindrome when reversing and adding within 50 iterations? (249)
    def problem55
        count = 0
        10000.downto(1) do |x|
            isLychrel = true
            num = x
            50.downto(1) do |n|
                num += num.to_s.reverse.to_i
                if isPalindrome(num)
                    isLychrel = false
                    break
                end
            end
            count += 1 if isLychrel
            count
        end
        count
    end
    
end