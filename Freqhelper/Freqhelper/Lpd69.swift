//
//  Lpd69.swift
//  Freqhelper
//
//  Created by Andrey Agafonov on 24/10/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import Foundation

class Lpd69 : Range {
    
    static let COUNT = 69
    
    let storedValues: Array<UInt64>
    
    init () {
        let base = FrequencyConverter.decihertzWithMegahertz(433, kilohertz: 75)
        let step = 25000
        var values = Array<UInt64>(count: Lpd69.COUNT, repeatedValue: 0)
        for index in 0...Lpd69.COUNT - 1 {
            values[index] = base + UInt64(index * step)
        }
        self.storedValues = values
    }
    
    var values : Array<UInt64> {
        return self.storedValues
    }
    
    var name : String {
        return "Lpd69";
    }

}