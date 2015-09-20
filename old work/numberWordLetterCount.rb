require "./mathematics_functions"
require "./mathematics_classes"
require "./language"
include Language
include Mathematics

#counting letters in words for numbers from 1 to 1000
=begin
#return written word representation of number n
#algorithm currently works to 9999
def toWords x
	n = x.to_i
	digits = n.to_s
	if n < 20
		return "one" if n == 1
		return "two" if n == 2
		return "three" if n ==3
		return "four" if n ==4
		return "five" if n == 5
		return "six" if n == 6
		return "seven" if n == 7
		return "eight" if n == 8
		return "nine" if n == 9
		return "ten" if n == 10
		return "eleven" if n == 11
		return "twelve" if n == 12
		return "thirteen" if n == 13
		return "fourteen" if n == 14
		return "fifteen" if n == 15
		return "sixteen" if n == 16
		return "seventeen" if n == 17
		return "eighteen" if n == 18
		return "nineteen" if n == 19
	else
		if digits.length == 4
			return "#{toWords(digits[0])}thousand#{toWords(digits[1..3])}"
		elsif digits.length == 3
			return "#{toWords(digits[0])}hundred#{(digits[1..2] == "00" ? "" : "and")}#{toWords(digits[1..2])}"
		elsif digits.length == 2
			tens = "twenty" if digits[0] == '2'
			tens = "thirty" if digits[0] == '3'
			tens = "forty" if digits[0] == '4'
			tens = "fifty" if digits[0] == '5'
			tens = "sixty" if digits[0] == '6'
			tens = "seventy" if digits[0] == '7'
			tens = "eighty" if digits[0] == '8'
			tens = "ninety" if digits[0] == '9'
			return "#{tens}#{toWords(digits[1])}"
		end			
	end
end

numbers = ""
1.upto(1000) { |x| 
	numbers.concat( toWords(x) ) 
	puts toWords x
}
puts( numbers.length )
=end