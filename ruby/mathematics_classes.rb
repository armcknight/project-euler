require "./mathematics_functions"
require "./functions"

include Functions

module Mathematics
  
	#=========================
	#CLASS: HypergeometricDist
	#=========================
	class HypergeometricDist
	
		#p is the type to find probability for, q is the other dichotomous type
		def initialize p, q
			@p = p
			@q = q
		end
		
		#probability that m out of n objects are of type p
		def probability m, n
			return 1.0 * combination( @p, m ) * combination( @q, ( n - m ) ) / combination( ( @p + @q ), n )
		end
	
		#mean for a sample of n objects from p+q total objects
		def mean n
			return n * ( 1.0 * @p / ( @p + @q ) )
		end
	
		#variance a sample of n objects from p+q total objects
		def variance n
			return 1.0 * n * ( 1.0 * @p / ( @p + @q ) ) * ( 1.0 * @q / ( @p + @q ) ) * ( 1.0 * ( ( @q + @p ) - n ) / ( ( @q + @p ) - 1 ) )
		end
	
		#standard deviation in a sample of n objects from p+q total objects
		def standardDeviation n
			return Math::sqrt( variance( n ) )
		end
	
	end
	
	#=========================
	#CLASS: Permutation
	#=========================
	class Permutation
		def initialize a
			@elements = a
		end
		
		def permuteNTimesLexicographically n
			return @elements if n == 0
			if n > 1
				i = factRoot n
				puts "n=#{n}, i=#{i}; #{toString}"
				swap @elements, -(i-1), -i
				return permuteNTimesLexicographically (n - factorial(i))
			elsif n == 1
				return swap @elements, -1, -2
			else
				return @elements
			end
		end
		
		def toString
			string = ""
			@elements.each{|n| string << n.to_s << ", "}
			return "[#{string.chop!.chop!}]"
		end
	end
	
end
