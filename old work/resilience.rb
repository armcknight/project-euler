require "./mathematics_functions"
include Mathematics

found = false
d = 1
s = 15499.0/94744.0
while !found do
    d += 1
    #puts d
    count = totient d
    puts "#{count}/#{d} = #{1.0*count/d} vs. #{s}"
    found = ((1.0*count/(d-1)) < s)
end
puts d