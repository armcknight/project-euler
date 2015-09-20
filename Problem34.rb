require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 34: Find the sum of all numbers which are equal to the sum of the factorial of each of their digits (40730)
    def problem34
        sum = 0
        factorials = { 1 => 1, 2 => 2, 3 => 6, 4 => 24, 5 => factorial(5), 6 => factorial(6), 7 => factorial(7), 8 => factorial(8), 9 => factorial(9), 0 => 1}
        (3..40730).each{|i|
            subSum = 0
            i.to_s.split("").each do |digit|
                subSum += factorials[digit.to_i]
            end
            if subSum == i
                sum += subSum
                # puts "adding #{i}; sum = #{sum}"
            end
        }
        sum
    end
    
end