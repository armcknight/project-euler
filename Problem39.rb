require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 39: If p is the perimeter of a right angle triangle with integral length sides, {a,b,c}, there are exactly three solutions for p = 120: {20,48,52}, {24,45,51}, {30,40,50} For which value of p <= 1000, is the number of solutions maximised? (840)
    def problem39
        perims = Hash.new
        1.upto(1000) do |a|
            1.upto(1000-a) do |b|
                1.upto(1000-(a+b)) do |c|
                    if a**2 + b**2 == c**2
                        if !perims.has_key?(p = a+b+c)
                            perims[p] = 1
                            else
                            perims[p] += 1
                        end
                    end
                end
            end
        end
        
        perims.key(perims.values.sort.last)
    end
    
end