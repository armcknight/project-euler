module Mathematics
  
    #return array of prime factors of n
    def primeFactors n
        factors = Array.new
        x = Math.sqrt(n).ceil
        while x > 1
            if n % x == 0 && isPrime(x)
                factors << x
                if isPrime(y = n / x)
                    factors << y
                end
            end
            x -= 1
        end
        f = factors.flatten.uniq.reverse
    end

    #returns integer corresponding to roman numeral s passed in as a string
    def fromRoman s
        sum = 0

        while s.length > 0
            #thousands
            if s[0] == "M"
                sum += 1000
                s = s.reverse.chop.reverse
            end
            #hundreds
            if s[0] == "D"
                sum += 500
                s = s.reverse.chop.reverse
            end
            if s[0] == "C"
                if s[1] == "M"
                    sum += 900
                    s = s.reverse.chop.chop.reverse
                    elsif s[1] == "D"
                    sum += 400
                    s = s.reverse.chop.chop.reverse
                    else
                    sum += 100
                    s = s.reverse.chop.reverse
                end
            end
            #tens
            if s[0] == "L"
                sum += 50
                s = s.reverse.chop.reverse
            end
            if s[0] == "X"
                if s[1] == "L"
                    sum += 40
                    s = s.reverse.chop.chop.reverse
                    elsif s[1] == "C"
                    sum += 90
                    s = s.reverse.chop.chop.reverse
                    else
                    sum += 10
                    s = s.reverse.chop.reverse
                end
            end
            #ones
            if s[0] == "V"
                sum += 5
                s = s.reverse.chop.reverse
            end
            if s[0] == "I"
                if s[1] == "V"
                    sum += 4
                    s = s.reverse.chop.chop.reverse
                    elsif s[1] == "X"
                    sum += 9
                    s = s.reverse.chop.chop.reverse
                    else
                    sum += 1
                    s = s.reverse.chop.reverse
                end
            end
        end
        sum
    end

	#returns string representation of minimal roman numeral equalling integer n
    def toRoman n
        #special cases
        return "" if n == 0

        string = String.new

        #thousands
        (n/1000).floor.times do
            string << "M"
        end
        n %= 1000

        #hundreds
        if n >= 900
            #attach for 900
            string << "CM"
            n -= 900
            elsif n >= 500
            #attach for 500
            string << "D"
            n -= 500
            elsif n >= 400
            #attach for 400
            string << "CD"
            n -= 400
        end
        #attach for remaining 100s
        (n/100).floor.times do
            string << "C"
        end
        n %= 100

        #tens
        if n >= 90
            #attach for 90
            string << "XC"
            n -= 90
            elsif n >= 50
            #attach for 50
            string << "L"
            n -= 50
            elsif n >= 40
            #attach for 40
            string << "XL"
            n -= 40
        end
        #attach for remaining tens
        (n/10).floor.times do
            string << "X"
        end
        n %= 10

        #ones
        if n == 9
            string << "IX"
            n -= 9
            elsif n >= 5
            string << "V"
            n -= 5
            elsif n == 4
            string << "IV"
            n -= 4
        end
        #attach remaining ones
        n.times do
            string << "I"
        end

        string
    end
	
	#returns true if all the elements in array a exist in array b
	def isPermutation a, b
		return false if a.count != b.count
        return false if a.uniq.count != b.uniq.count
		return a.sort == b.sort
	end

    #returns numerator and denominator (in an array of length 2) of the fraction in simplest
    #terms equivalent to the fraction supplied with num and den
    def simplestTerms num, den
        puts "#{num} / #{den}"
        return [num, den] if (factor = gcf(num, den)) == nil
        frac = [num / factor, den / factor]
        if (d = frac[1])%(n = frac[0]) == 0
            return [1, d / n]
        end
        return frac if gcf(frac[0], frac[1]) == nil
        return simplestTerms(frac[0], frac[1])
    end

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

	#returns true if a and b are relatively prime, ie, share no common factors other than 1
	def areCoprime? a, b
		return true if gcd(a,b) == 1
		false
	end
  
	#returns an array of amicable numbers lesser than n:
	#numbers a, b, a!=b such that sum(properDivisors(a) == b and 
	#sum(properDivisors(b) == a
	def amicableNumbersUnder n
		h = Array.new
		1.upto(n) do |x|
			y = sum(properDivisors(x))
			h.push x if x != y && x == sum(properDivisors(y))
		end
		h
	end
  
	#returns array of primes up to n
	def primesUpto n
	  	nums = Array.new
	  	2.upto(n) { |x| nums[x] = true }
	  	2.upto(n) { |x| 
	  		if nums[x]
	  			z = x
	  			while z < n 
	  				z += x
	  				nums[z] = false
	  			end
	  		end
	  	}
	  	primes = Array.new
	  	2.upto(n) { |x| primes.push x if nums[x] }
	  	primes
	end
  
	#returns true if n is prime, false otherwise
	def isPrime n
	  	divisors(n).size == 2
	end

	#return the factorial of n
	def factorial n
		return 1 if n <= 1
		#return n * factorial( n - 1 )
        prod = 1
        n.downto(2) do |x|
            prod = prod * x
        end
        prod
	end

	#return number of combinations possible from combining r objects
	#from a domain of d objects
	def combination d, r
		return 0 if d < r
		return 1 if d == r
		return  factorial( d ) / ( factorial( r ) * factorial( d - r ) )
	end

	#return number of permutations of length l possible from n different elements without repetition
	#if repetition is allowable, then the result is merely n^l
	def permutation n, l
		return 0 if l > n
		return factorial( n ) / factorial( n - l )
	end
	
	#returns the result of euler's totient function for n
	def totient n
		return n * (factors = primeFactors(n)).inject(1) {|coef,x| coef *= (x-1)} / factors.inject(1) {|coef,x| coef *= x}		
    end

    #returns greatest common factor of two numbers
    def gcf a, b
        if b%a == 0 || a%b == 0
            return a
        elsif [a,b].min == [a,b].min % [a,b].max
            return 1
        elsif isPrime(a) && isPrime(b)
            return 1
        end
        aPrimeFactors = primeFactors(a)
        bPrimeFactors = primeFactors(b)
        intersection = intersection(aPrimeFactors, bPrimeFactors)
        return intersection.sort.last
    end
	
	#returns i such that i! <= n < (i + 1)!
	def factRoot n
		i = 2
		until false
			return (i - 1) if factorial(i) > n
			i += 1
		end
	end
  
	#circular primes are primes that remain prime through each rotation of their digits
	#e.g. 113 is a circular prime because 113, 131, and 311 are all prime
	#23 is prime, but 32 is not, so 23 is not a circular prime
	def isCircularPrime n
        #puts "isCircularPrime #{n}"
	  	return true if n == 2
		a = n.to_s.split( "" )
        #puts "a.join = #{a.join}"
	  	return false if( a.join.include?("2") || a.join.include?("4") || a.join.include?("6") || a.join.include?("8") || a.join.include?("0") )
		(a.count - 1).downto(0) do |x|
			return false if ! isPrime a.rotate(x).join.to_i
		end
		return true
	end
  
	#returns true if a prime n remains prime when digits are removed from the right continuously
	#until only one digit remains
	def isRightTruncatablePrime n	
	  	(n.to_s.length).downto(2) do |x|
	  		n = n.to_s.chop.to_i
	  		return false if ! isPrime(n)
	  	end
	  	return true
	end
  
	#returns true if a prime n remains prime when digits are removed from the left continuously
	#until only one digit remains
	def isLeftTruncatablePrime n
	  	(n.to_s.length).downto(2) do |x|
	  		n = n.to_s.reverse.chop.reverse.to_i
	  		return false if ! isPrime(n)
	  	end
	  	return true
	end
	  
	#returns number of first fibonacci term with n digits
    def firstFibTermWithNDigits n
        f = Array.new
        f.push 1
        f.push 1
        f.push(f[-1] + f[-2]) while f.last.to_s.length < n
        f.count
    end

	#returns array of fibonacci numbers <= n
	def fibUpto n
		fibs = Array.new
		fibs << 1 << 1
		while (nextFib = fibs[-1] + fibs[-2]) <= n
			fibs << nextFib
		end
		fibs
	end
  
	#returns the nth triangle number
	#eg: the 7th triangle number is 7 + 6 + 5 + 4 + 3 + 2 + 1 = 28
	def nthTriangularNumber n
		return ( n * ( n + 1 ) / 2 )
	end
	
	#returns true if n is triangular, false otherwise
    def isTriangular n
        return false if( (0.25 + 2.0 * n) < 0 )
        quad = quadratic(1.0, 1.0, -2.0*n)
        return true if isWholeNumber(quad[0]) || isWholeNumber(quad[1])
        false
    end

	def nthPentagonalNumber n
		return ( ( 3 * n * n - n ) / 2 )	
	end
	
	#returns true if n is pentagonal, false otherwise
	def isPentagonal n
		return false if( (1 + 24.0*n) < 0 )
		quad = quadratic(3.0,-1.0,-2.0*n)
		return true if isWholeNumber(quad[0]) || isWholeNumber(quad[1])
		false
	end
	
	def nthHexagonalNumber n
		return ( n * ( 2 * n - 1 ) )
	end
	
	#returns true if n is a whole number, otherwise false
    def isWholeNumber n
        return true if ! (s = n.to_s).include? "."
        return false if( (ss = s.slice((i = s.index(".")), s.length - i)).include?( "1" ) || ss.include?( "2" ) || ss.include?( "3" ) || ss.include?( "4" ) || ss.include?( "5" ) || ss.include?( "6" ) || ss.include?( "7" ) || ss.include?( "8" ) || ss.include?( "9" ) )
        true
    end

	#returns an array of two values, which are the solutions to the quadratic equation
    def quadratic a, b, c
        s = (1.0*b)**2 - 4.0*a*c
        return [nil,nil] if s < 0
        return [(-1.0 * b + Math.sqrt(s)) / 2.0*a, (-1.0 * b - Math.sqrt(s)) / 2.0*a]
    end
    
    #returns sorted array of divisors in [1,n]
    def divisors n
        (1..(Math.sqrt(n).floor)).to_a.select {|x| n % x == 0}.map {|x| [x,n/x]}.flatten.uniq.sort
    end

    #returns sorted array of divisors in [1,n)
    def properDivisors n
        divisors(n)[0..-2]
    end

    #sums the numeric values of supplied array and returns sum
    def sum a
        a.size > 0 ? a.reduce(:+) : 0
    end

    #returns 0 if n is perfect (sum of its divisors = n)
    #returns -1 if n is deficient (sum of divisors < n)
    #returns 1 if abundant (sum of divisors > n)
    def perfectness n
        sum(properDivisors(n)) <=> n
    end

    # list all abundant numbers in [12,n] (12 is the smallest abundant number)
    def abundantsTo n
        (12..n).to_a.select{|x| perfectness(x) == 1}
    end

    # list all deficient numbers in [1,n]
    def deficientsTo n
        (1..n).to_a.select{|x| perfectness(x) == -1}
    end

    # list all perfect numbers in [6,n] (6 is the smallest perfect number)
    def perfectsTo n
        (6..n).to_a.select{|x| perfectness(x) == 0}
    end

    # construct cartesian product square matrix from an array
    # [1,2,3] produces
    #
    # [ [1,2,3]
    #   [1,2]
    #   [1]     ]
    def cartesian a
        (0..(a.size-1)).inject([]){|arrays,itemsToRemove| arrays << a[0..(-(itemsToRemove+1))]}
    end

    def dynamicCartesian matrix, operation
        matrix.size.times
    end

	#converts a decimal number to a binary number (returns an int value)
	def decToBin n
		bin = ""
		until n == 0
			bin.concat((n % 2).to_s)
			n /= 2
		end
		bin.reverse.to_i
	end

	#returns the set union of two arrays (A or B)
	def union a, b
	
	end
	
	#returns the set intersection of two arrays (A and B)
	def intersect a, b
		return [] if a.count == 0 || b.count == 0
		newSet = Array.new
		a.each do |x|
			newSet << x if b.include? x
		end
		newSet
	end
	
	#returns the set difference of two arrays (A - B)
	#returns nil if A and B are identical
	def difference a, b
		dif = a
		b.each do |x|
			if (amt = a.count(x)) > 1
				dif.delete_at(dif.index(x))
			elsif amt == 1
				dif.delete(x)
			end
		end
		return nil if dif.count == 0
		dif
	end
	
	#returns true if the square root of n is a whole number
	def isSquare n
		2.upto(Math.sqrt(n).ceil) do |x|
			return true if x**2 == n
		end
		false
    end

	#returns true if collection of digits (digs) is pandigital on the interval [a,b]
	def isABPandigital digs, a, b
		s = digs.to_s
		(a..b).each do |x|
			return false if s.count(x.to_s) != 1
		end
		true
	end

    # Returns largest sum of all possible paths from top to bottom of a triangle filled with values. see problems 18/67 on project euler
    def maximumPathFromTopToBottomOfTriangle t
        1.upto(t.count-1) do |i|
            row = t[i]
            0.upto(row.count-1) do |j|
                frames = Array.new(2, -1)

                current = row[j]
                if j > 0
                    frames[0] = t[i-1][j-1]
                end
                if j < t[i-1].count
                    frames[1] = t[i-1][j]
                end
                t[i][j] = frames.sort.last + current
            end
        end

        t.last.sort.last
    end
end
