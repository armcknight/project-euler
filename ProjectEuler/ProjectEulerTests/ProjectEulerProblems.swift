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
        XCTAssert(600851475143.primeFactors().sort().last! == 6857)
    }

    /// 5: find smallest positive number evenly divisible by all of the numbers in [1,20] (232792560)
    func testProblem5() {

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
