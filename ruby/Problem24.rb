require "./mathematics_functions"
require "./mathematics_classes"
include Mathematics

module ProjectEuler

    # 24: What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9? (2783915460)
    def problem24
        answer = 0
#        (0..20).each {|x|
            #puts"============================================\nX=#{x}"
            perm = Permutation.new([0,1,2,3,4,5,6,7,8,9])
            answer = perm.permuteNTimesLexicographically 1000000
            #puts "\n\n"
#        }
    answer
    end
    
end