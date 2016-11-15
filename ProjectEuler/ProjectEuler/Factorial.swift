//
//  Factorial.swift
//  ProjectEuler
//
//  Created by Andrew McKnight on 1/11/16.
//  Copyright © 2016 AMProductions. All rights reserved.
//

import Foundation

postfix operator *! {}

postfix func *!<T where T: IntegerType, T: IntegerArithmeticType>(n: T) -> T {
    return factorial(n)
}

func factorial<T where T: IntegerType, T: IntegerArithmeticType>(n: T) -> T {
    if n <= 1 { return 1 }

    var prod: T = 1
    for i: T in 2...n {
        prod *= i
    }
    
    return prod
}
