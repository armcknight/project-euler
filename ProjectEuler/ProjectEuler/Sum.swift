//
//  Sum.swift
//  ProjectEuler
//
//  Created by Andrew McKnight on 1/11/16.
//  Copyright © 2016 AMProductions. All rights reserved.
//

import Foundation

extension SequenceType where Generator.Element == Float {

    // sum all elements in the collection
    func sum() -> Float {
        return self.reduce(0, combine: +)
    }

}

extension SequenceType where Generator.Element == Float80 {

    // sum all elements in the collection
    func sum() -> Float80 {
        return self.reduce(0, combine: +)
    }

}

extension SequenceType where Generator.Element == Double {

    // sum all elements in the collection
    func sum() -> Double {
        return self.reduce(0, combine: +)
    }
    
}

extension SequenceType where Generator.Element == Int {

    // sum all elements in the collection
    func sum() -> Int {
        return self.reduce(0, combine: +)
    }

}
