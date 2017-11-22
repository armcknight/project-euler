//
//  ProjectEulerProblems.swift
//  ProjectEuler
//
//  Created by Andrew McKnight on 11/23/16.
//  Copyright © 2016 AMProductions. All rights reserved.
//

import XCTest
@testable import ProjectEuler

class ProjectEulerProblems: XCTestCase {

    /// 3: find largest prime factor of 600851475143 (6857)
    func testProblem3() {
        XCTAssert(600851475143.primeFactors().sorted().last! == 6857)
    }

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

    /// 7: find 10001st prime number (104743)
    func testProblem7() {
        var primes = 1
        var current = 1
        while primes < 10001 {
            current += 2
            if current.isPrime() {
                primes += 1
            }
        }
        XCTAssert(current == 104743)
    }

    /// 9: find the product of the only pythagorean triplet where a + b + c = 1000 (31875000)
    func testProblem9() {
        var triplet = 0
        var c = 0
        for a in 1...300 {
            for b in (a + 1)...(a + 300) {
                c = Int(sqrt(pow(Double(a), 2.0) + pow(Double(b), 2.0)))
                if 1000 - c == b + a {
                    triplet = a * b * c
                }
            }
        }

        XCTAssert(triplet == 31875000, "expected \(31875000) but got \(triplet)")
    }
    
}
