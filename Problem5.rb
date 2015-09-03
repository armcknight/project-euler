require "./mathematics_classes"
include Mathematics

# 5: find smallest positive number evenly divisible by all of the numbers in [1,20] (232792560)
def problem5
    n = 20
    divs = (1..n).to_a
    lcms = Array.new

    2.upto(20) do |z|
        divs.combination(z).to_a.each do |a|
            prod = 1
            a.each do |b|
                prod*=b
            end
            found = true
            1.upto(20) do |z|
                if prod % z != 0
                    found = false
                    break
                end
            end
            if found
                lcms << prod
                break
            end
        end
    end

    puts lcms.uniq.sort[0]
end