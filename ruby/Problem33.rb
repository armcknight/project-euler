require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 33: find the denominator of the simplified rational product of the four non-trivial fractions less than 1 with double-digit numerators/denominators that each share a common digit that when removed produces a fraction that is not congruent to the original (100)
    def problem33
        num, den = 1, 1
        10.upto(98) do |x|
            (x+1).upto(99) do |y|
                if (((simplestTerms(x,y)<=>simplestTerms((n = (a = x.to_s)[0].to_i), (d = (b = y.to_s)[1].to_i))) == 0 && a[1] == b[0]) ||
                    ((simplestTerms(x,y)<=>simplestTerms((n = a[1].to_i), (d = b[0].to_i))) == 0 && a[0] == b[1]) &&
                    (a[0] != b[0] && a[1] != b[1] && a[0] != a[1] && b[0] != b[1]))
                    num, den = num * n, den * d
                    # puts "#{x}/#{y} == #{n}/#{d}"
                end
            end
        end
        ratio = simplestTerms(num,den)
        ratio[1] # return the denominator
        # puts "#{(r = simplestTerms(num,den))[0]}/#{r[1]}"
    end
    
end