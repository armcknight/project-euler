require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 57:
=begin
     It is possible to show that the square root of two can be expressed as an infinite continued fraction.

     √ 2 = 1 + 1/(2 + 1/(2 + 1/(2 + ... ))) = 1.414213...

     By expanding this for the first four iterations, we get:

     1 + 1/2 = 3/2 = 1.5
     1 + 1/(2 + 1/2) = 7/5 = 1.4
     1 + 1/(2 + 1/(2 + 1/2)) = 17/12 = 1.41666...
     1 + 1/(2 + 1/(2 + 1/(2 + 1/2))) = 41/29 = 1.41379...

     The next three expansions are 99/70, 239/169, and 577/408, but the eighth expansion, 1393/985, is the first example where the number of digits in the numerator exceeds the number of digits in the denominator.

     In the first one-thousand expansions, how many fractions contain a numerator with more digits than denominator? (153)
=end
    def problem57
        #continued fraction for √2
        #puts "1"
        convN = 3
        convD = 2
        #puts "#{convN}/#{convD}"

        count = 0
        2.upto(1000) do |x|
            convN += convD
            temp = convN
            convN = convD
            convD = temp
            convN += convD
            #puts "#{convN}/#{convD}"
            count += 1 if convN.to_s.length > convD.to_s.length
        end
        count
    end
    
end