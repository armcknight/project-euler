require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 14: find largest number < 1,000,000 that produces the longest integer chain terminating at 1 given the following rules: if n is even n = n / 2; if n is odd n = 3n + 1 (837799)
    def problem14
        starter, high = 3, 0
        3.upto(999999) { |x|
            if !( x % 2 == 0 )
                temp = x
                count = 0
                until x == 1
                    if x % 2 == 0
                        x /= 2
                        else
                        x = x * 3 + 1
                    end
                    count += 1
                end
                if count > high
                    starter, high = temp, count
                end
            end
        }
        starter
    end

end