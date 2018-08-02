//
//  Problem5.swift
//  ProjectEulerTests
//
//  Created by Andrew McKnight on 8/1/18.
//  Copyright © 2018 AMProductions. All rights reserved.
//

import XCTest

class Problem5: XCTestCase {
    
    // FIXME: Disabled because it hangs
    /// 5: find smallest positive number evenly divisible by all of the numbers in [1,20] (232792560)
    func testProblem5() {
        let n = 20
        let divs: Set<Int> = Set(Array(1...n))
        var lcms = [Int]()
        
        /*
         instead of testing all numbers [1,20!] for divisibility by all numbers in [1,20], we only need to test numbers that are multiples of some combination of numbers in [1,20]. This will exclude testing divisibility of numbers that are both < 20! but not constructed by multiplications of any numbers ≤ 20. There are many primes between 20 and 20!.
         
         so take all possible combinations of numbers in [1,20], of all possible lengths, compute the product of the numbers in each combination, and test for divisibility. Store all numbers that pass, and sort and take the lowest.
         */
        for z in 6...20 {
            let combinations: Set<Set<Int>> = divs.combinationsRecursive(combinationSize: z)
            for combination in combinations {
                
                let winner: Set<Int> = [11, 13, 14, 17, 18, 19, 20]
                if combination == winner {
                    print("winner")
                }
                
                // try next product of some numbers in [1,20]
                var prod = 1
                combination.forEach {
                    prod *= $0
                }
                
                // is it divisible by all numbers in [1,20]?
                var found = true
                for k in 1...20 {
                    if prod % k != 0 {
                        found = false
                        break
                    }
                }
                
                if found {
                    print("adding \(prod) = ∏(\(combination))")
                    lcms.append(prod)
                }
            }
        }
        let result =  Array(Set(lcms)).sorted().first!
        XCTAssertEqual(result, 232792560)
    }
    
}
