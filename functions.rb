module Functions
	def swap r, a, b
		temp = r[b]
		r[b] = r[a]
		r[a] = temp
	end
end