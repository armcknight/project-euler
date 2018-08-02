//
//  Problem3.swift
//  ProjectEulerTests
//
//  Created by Andrew McKnight on 8/1/18.
//  Copyright © 2018 AMProductions. All rights reserved.
//

import FastMath
import XCTest

class Problem3: XCTestCase {
    
    /// 3: find largest prime factor of 600851475143 (6857)
    func testProblem3() {
        XCTAssert(600851475143.primeFactors().sorted().last! == 6857)
    }
    
}
