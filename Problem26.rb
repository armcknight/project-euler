require './mathematics_functions'
include Mathematics

module ProjectEuler

    # NUMERATOR = 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    NUMERATOR = 10000000000000000

    # check if the sequence of digits from start_index to (start_index + pattern_length) repeats starting at the next position
    def pattern_repeats_from_location?(start_index, pattern_length, digits)
        pattern_digits = digits[start_index..(start_index + pattern_length)]
        repeat_test_start_index = start_index + pattern_length
        while repeat_test_start_index + pattern_length < digits.count
            test_cycle_upper_bound = repeat_test_start_index + pattern_length
            # puts "testing if #{pattern_digits.join} repeats in digits #{repeat_test_start_index}-#{test_cycle_upper_bound}"
            test_pattern_digits = digits[repeat_test_start_index..test_cycle_upper_bound]
            if pattern_digits != test_pattern_digits
                # puts "#{pattern_digits.join} does not repeat in the digits (found #{test_pattern_digits.join})"
                return false
            elsif test_cycle_upper_bound == digits.count
                return true
            end
            puts "repeat_test_start_index = #{repeat_test_start_index}; test_cycle_upper_bound = #{test_cycle_upper_bound}"
            repeat_test_start_index += pattern_length
        end
         return false
    end

    # check if a pattern of a certain length starting at any point in the digits repeats after its first instance
    def pattern_of_length_repeats?(test_cycle_length, digits)
        0.upto(digits.count - test_cycle_length) do |pattern_start_index|
            if pattern_repeats_from_location?(pattern_start_index, test_cycle_length, digits)
                puts "#{digits[pattern_start_index..(pattern_start_index + test_cycle_length)].join} repeats"
                return true
            end
        end
        false
    end

    # returns tuple <found, den> where found is true if a repeating pattern was found with the desired length, and den is the denominator in the rational number whose decimal representation contains the repeating patter
    DENOMINATOR_MAX = 20
    def denominator_with_repeating_pattern_of_length(pattern_length, last_longest_pattern_denominator)
        7.upto(DENOMINATOR_MAX) { |denominator|
            fraction = NUMERATOR / denominator
            digits = fraction.to_s.split('')

            puts "1/#{denominator}=#{fraction}"

            if pattern_of_length_repeats?(pattern_length, digits)
                _, longest_pattern_denominator = denominator_with_repeating_pattern_of_length(pattern_length + 1, denominator)
                return true, longest_pattern_denominator
            end
        }
        return false, last_longest_pattern_denominator
    end

    # 26: Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part. ()
    def problem26
        _, longest_cycle_denominator = denominator_with_repeating_pattern_of_length(1, 3)
        longest_cycle_denominator
    end

end

include ProjectEuler

puts problem26