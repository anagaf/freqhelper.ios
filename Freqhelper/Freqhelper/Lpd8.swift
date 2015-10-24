//
//  Lpd8.swift
//  Freqhelper
//
//  Created by Andrey Agafonov on 24/10/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import Foundation

class Lpd8: Range {
    
    let storedValues: Array<Int> = [
        FrequencyConverter.decihertzWithMegahertz(433, kilohertz: 75),
        FrequencyConverter.decihertzWithMegahertz(433, kilohertz:100),
        FrequencyConverter.decihertzWithMegahertz(433, kilohertz:200),
        FrequencyConverter.decihertzWithMegahertz(433, kilohertz:300),
        FrequencyConverter.decihertzWithMegahertz(433, kilohertz:350),
        FrequencyConverter.decihertzWithMegahertz(433, kilohertz:475),
        FrequencyConverter.decihertzWithMegahertz(433, kilohertz:625),
        FrequencyConverter.decihertzWithMegahertz(433, kilohertz:800)
    ]
    
    var values : Array<Int> {
        return self.storedValues
    }
    
    var name : String {
        return "Lpd8";
    }

}