require "./mathematics_functions"
include Mathematics

module ProjectEuler

    # 45: find first triangle number after the 285th that is also pentagonal and hexagonal (1533776805)
    def problem45
        triN, pentN, hexN = 285, 1, 1
        while true
            tri, pent, hex = nthTriangularNumber(triN), nthPentagonalNumber(pentN), nthHexagonalNumber(hexN)
            #puts "T(#{triN})=#{tri} == P(#{pentN})=#{pent} == H(#{hexN})=#{hex}" if tri == pent && tri == hex
            if tri == pent && tri == hex
                if triN > 285
                    return tri
                end
            end

            if tri < pent
                if tri < hex
                    triN += 1
                else
                    if hex < pent
                        hexN += 1
                    else
                        pentN += 1
                    end
                end
            else
                if pent < hex
                    pentN += 1
                else
                    hexN += 1
                end
            end
        end
    end
    
end