//
//  Lpd69.swift
//  Freqhelper
//
//  Created by Andrey Agafonov on 24/10/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import Foundation

class Lpd69 : Range {
    
    let storedValues: Array<Int>
    
    init () {
        let base = FrequencyConverter.decihertzWithMegahertz(433, kilohertz: 75)
        let step = 25000
        var values: Array<Int> = []
        for index in 1...69 {
            values[index] = base + (index - 1) * step
        }
        self.storedValues = values
    }
    
    var values : Array<Int> {
        return self.storedValues
    }
    
    var name : String {
        return "Lpd69";
    }

}