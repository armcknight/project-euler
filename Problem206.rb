require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 206: Find the unique positive integer whose square has the form 1_2_3_4_5_6_7_8_9_0 where each '_' is a single digit. (1389019170)
    def problem206
        Math.sqrt(1020304050607080900).floor.upto(m = Math.sqrt(1929394959697989990).ceil) do |x|
            if (s = x.to_s)[s.length - 1].to_i % 2 == 0
                puts "#{x} of #{m}"
                q = x**2
                if(s = q.to_s)[18].to_i == 0 && s[16].to_i == 9 && s[14].to_i == 8 && s[12].to_i == 7 && s[10].to_i == 6 && s[8].to_i == 5 && s[6].to_i == 4 && s[4].to_i == 3 && s[2].to_i == 2
                    puts s
                    break
                end
            end
        end
    end
    
end