require "./mathematics_classes"
include Mathematics

# 12: find first triangle number with over 500 divisors (76576500)
def problem12
    divisors, n, tNum = 0, 0, 0
    while divisors < 500
        n += 1
        divisors = properDivisors(tNum = nthTriangularNumber(n)).count
    end
    tNum
end