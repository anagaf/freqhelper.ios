//
//  FrequencyConverter.swift
//  Freqhelper
//
//  Created by Andrey Agafonov on 24/10/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import Foundation

let DECIHERTZ_PER_MEGAHERTZ : UInt64 = 10000000
let DECIHERTZ_PER_KILOHERTZ : UInt64 = 10000
let DECIHERTZ_PER_HERTZ : UInt64 = 10

class FrequencyConverter {

    static func decihertzWithMegahertz(megahertz: UInt64, kilohertz: UInt64) -> UInt64 {
        return decihertzWithMegahertz(megahertz, kilohertz: kilohertz, hertz: 0)
    }

    static func decihertzWithMegahertz(megahertz: UInt64, kilohertz: UInt64, hertz: UInt64) -> UInt64 {
        return megahertz * DECIHERTZ_PER_MEGAHERTZ
            + kilohertz * DECIHERTZ_PER_KILOHERTZ
            + hertz * DECIHERTZ_PER_HERTZ;
    }
    
    static func megahertzComponent(decihertz: UInt64) -> Int {
        return Int(decihertz / DECIHERTZ_PER_MEGAHERTZ);
    }
    
    static func kilohertzComponent(decihertz: UInt64) -> Int {
        return Int(decihertz % DECIHERTZ_PER_MEGAHERTZ / DECIHERTZ_PER_KILOHERTZ)
    }
    
    static func hertzComponent(decihertz : UInt64) -> Int {
        return Int(decihertz % DECIHERTZ_PER_KILOHERTZ / DECIHERTZ_PER_HERTZ)
    }
}