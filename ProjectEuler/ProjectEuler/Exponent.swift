//
//  Exponent.swift
//  ProjectEuler
//
//  Created by Andrew McKnight on 1/11/16.
//  Copyright © 2016 AMProductions. All rights reserved.
//

import Foundation

infix operator ** {}

// Integer case

func **<T where T: IntegerType, T: IntegerArithmeticType>(base: T, power: T) -> T {
    return exponentiate(base, power)
}

func exponentiate<T where T: IntegerType, T: IntegerArithmeticType>(base: T, _ power: T) -> T {
    var result = base
    var mutablePower = power
    while mutablePower > 1 {
        result *= base
        mutablePower--
    }
    return result
}

// Floating-point cases

/// applies to `Float` and `Float32`
func **(base: Float, power: Float) -> Float {
    return powf(base, power)
}

/// applies to `Double` and `Float64`
func **(base: Double, power: Double) -> Double {
    return pow(base, power)
}

func **(base: Float80, power: Float80) -> Float80 {
    // TODO: implement
    return -1.0
}
