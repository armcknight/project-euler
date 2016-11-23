require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 17: count letters in words for numbers in [1,1000] (21124)
    def problem17
        numbers = ""
        1.upto(1000) { |x|
            numbers << toWords(x)
        }
        numbers.length
    end
    
end