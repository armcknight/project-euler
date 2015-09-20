sum = 0
1.upto(10000000) do |x|
    #puts x
    largest = 0
    1.upto(x-1) do |n|
        largest = n if n*n % x == n && n > largest
    end
    sum = sum + largest
    #puts "M(#{x}) = #{largest}"
end

puts sum