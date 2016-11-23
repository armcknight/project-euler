require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 30: Find the sum of all the numbers that can be written as the sum of fifth powers of their digits. (443839)
    def problem30
        total = 0
        (10..1000000).each{|n|
            total += n if n == n.to_s.split("").inject(0){|sum,d|sum+=d.to_i**5}
        }
        total
    end
    
end