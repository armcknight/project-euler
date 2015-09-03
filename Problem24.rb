require "./mathematics_classes"
include Mathematics

# 24: What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9? (2783915460)
def problem24
    (0..20).each {|x|
        puts"============================================\nX=#{x}"
        perm = Permutation.new([1,2,3,4,5])
        perm.permuteNTimesLexicographically x
        puts "\n\n"
    }
end