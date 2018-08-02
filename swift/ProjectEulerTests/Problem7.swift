//
//  Problem7.swift
//  ProjectEulerTests
//
//  Created by Andrew McKnight on 8/1/18.
//  Copyright © 2018 AMProductions. All rights reserved.
//

import XCTest

class Problem7: XCTestCase {
    
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
    
}
