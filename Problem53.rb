require "./mathematics_classes"
include Mathematics

# 53: How many, not necessarily distinct, values of nCr, for 1 ≤ n ≤ 100, are greater than one-million? (4075)
def problem53
    count = 0
    1.upto(100) do |n|
        1.upto(n) do |r|
            count += 1 if combination(n, r) > 1000000
        end
    end
    count
end