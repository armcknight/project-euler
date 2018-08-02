//
//  Problem10.swift
//  ProjectEulerTests
//
//  Created by Andrew McKnight on 8/1/18.
//  Copyright © 2018 AMProductions. All rights reserved.
//

import XCTest

class Problem10: XCTestCase {
    
    /// 10: find sum of all primes under 2,000,000 (142913828922)
    func testProblem10() {
        XCTAssertEqual(Array<Int>(2_000_000.primesUnder()).sum(), 142913828922)
    }
    
}
