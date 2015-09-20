module Language
	def isPalindrome n
		s = n.to_s
		low, high = 0, s.length - 1
		until low > high do
			if s[low] != s[high]
				return false
			else
				low += 1
				high -= 1
			end
		end
		return true
	end
end