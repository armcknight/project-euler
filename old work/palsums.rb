require "./mathematics_functions"
require "./language"
include Language
include Mathematics

def sumSeries a, b
    return a*b if a==b
    sum = 0
    a.upto(b) do |m|
        #puts "m = #{m}; sum + #{m*m} = #{sum + m*m}"
       sum += m*m
    end
    return sum
end

z = 10000
total = 0
1.upto(z) do |x|
    
    x.upto(100000000) do |y|
        ss = sumSeries(x, y)
        if(isPalindrome(ss)) && ss < 100000000
            total += ss
            puts "sumSeries(#{x}, #{y}) = #{ss}; total = #{total}"
        end
        if ss > 100000000
            break
        end
    end
    
end
puts total