require "./mathematics_classes"
include Mathematics

# 20: find sum of digits of 100! (648)
def problem20
    a = factorial(100).to_s.split("")
    sum = 0
    a.each do |x|
        sum += x.to_i
    end
    puts sum
end