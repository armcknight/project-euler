require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 70: minimize n/totient(n) where n in [1,10^7] and totient(n) is a permutation of n (8319823)
    def problem70
        # generate all (n,totient(n),n/totient(n)) triplets and sort by the ratio, then iterate to check for permutations and return the one with the minimal ratio
        minRatio = 2
        number = 4
        10e7.to_i.downto(4) { |n|
            t = totient(n)
            next if t == number
#            puts "n = #{n}; totient = #{t}"
            ratio = 1.0 * n / t
            next if ratio >= minRatio
#                puts "testing min: #{n}/#{t} = #{ratio}"
            next if !isPermutation(t.to_s.split(""), n.to_s.split(""))

            puts "found next minimization: #{n}"
            minRatio = ratio
            number = n
        }
        return number

        #    lim = 10**7
        #    #a = 176569
        #    a = 4
        #    puts "#{min = 1.0 * a / totient(a)}"
        #    lim.downto(a) do |x|
        #        if isPermutation(x.to_s.split(""), (t = totient(x)).to_s.split("")) && t != x
        #            if (ratio = 1.0 * x / t) < min
        #                puts "n = #{x}; totient(#{x}) = #{t}; min = #{(min = ratio)}"
        #            end
        #        end
        #    end
        #    puts min
    end
    
end