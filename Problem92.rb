require "./mathematics_classes"
include Mathematics

# 92: how many numbers below 10,000,000 reduce to 89 with the following rules: add the square of the numbers digits to itself; if the sum is equal to a previous sum, stop. (8581146)
def problem92
    count = 0
    10000000.downto(1) do |n|
        #puts n
        ds = n
        stop = false
        while !stop
            sum = 0
            ds.to_s.split('').each do |d|
                sum += d.to_i*d.to_i
            end
            ds = sum
            if ds == 89
                puts "89"
                count += 1
                stop = true
                elsif ds == 1
                puts "1"
                stop = true
            end
        end
    end
    count
end