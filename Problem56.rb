require "./mathematics_classes"
include Mathematics

# 56: for n=a^b, a,b in [1,100], such that the sum of n's digits is maximized, what is the sum of its digits? (972)
def problem56
    max = 0
    99.downto(1) do |b|
        99.downto(1) do |a|
            e = a**b
            sum = 0
            e.to_s.split('').each do |d|
                sum += d.to_i
            end
            max = sum if sum > max
        end
    end
    max
end