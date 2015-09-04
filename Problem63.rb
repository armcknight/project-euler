# 63: How many n-digit positive integers exist which are also an nth power? ()

def problem63
    count = 0
    1.upto(9) { |base|
        over = false
        power = 1
        until over
            number = base**power
            digits = number.to_s.length
            if digits == power
                count += 1
                puts "#{number} = #{base}^#{power} and has #{power} digits"
            elsif digits > power or power > 50
                over = true
            end
            power += 1
        end
    }
    count
end

puts problem63