require "./mathematics_classes"
include Mathematics

# 9: find the product of the only pythagorean triplet where a + b + c = 1000 (31875000)
def problem9
    #loop through a's
    c = 0
    1.upto(300) do |a|
        #loop through b's
        (a + 1).upto(a + 300) do |b|
            if 1000 - (c = Math.sqrt(a**2 + b**2)) == b + a
                puts(a * b * c)
            end
        end
    end
end