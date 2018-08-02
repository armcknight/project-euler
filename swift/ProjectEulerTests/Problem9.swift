//
//  Problem9.swift
//  ProjectEulerTests
//
//  Created by Andrew McKnight on 8/1/18.
//  Copyright © 2018 AMProductions. All rights reserved.
//

import XCTest

class Problem9: XCTestCase {
    
    /// 9: find the product of the only pythagorean triplet where a + b + c = 1000 (31875000)
    func testProblem9() {
        var triplet = 0
        var c: Double
        for a in 1...300 {
            for b in (a + 1)...(a + 300) {
                c = sqrt(pow(Double(a), 2.0) + pow(Double(b), 2.0))
                let sum = b + a
                let difference = 1000.0 - c
                if difference == Double(sum) {
                    print("a: \(a), b: \(b), c: \(c)")
                    triplet = a * b * Int(c)
                    break
                }
            }
        }
        
        XCTAssert(triplet == 31875000, "expected \(31875000) but got \(triplet)")
    }
    
}
