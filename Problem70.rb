require "./mathematics_classes"
include Mathematics

# 70: minimize n/totient(n) where n in [1,10^7] and totient(n) is a permutation of n (8319823)
def problem70
    # generate all (n,totient(n),n/totient(n)) triplets and sort by the ratio, then iterate to check for permutations and return the one with the minimal ratio
    (4..10e7).inject(Array.new){|triplets,n| triplets << [n,totient(n),1.0*n/totient(n)]}.sort{|a,b|a[2]<=>b[2]}.take{|t|isPermutation(t[0].to_s.split(""),t[1].to_s.split(""))}[0]

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