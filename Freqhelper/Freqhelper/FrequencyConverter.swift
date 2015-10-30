//
//  FrequencyConverter.swift
//  Freqhelper
//
//  Created by Andrey Agafonov on 24/10/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import Foundation

class FrequencyConverter {
    static let DECIHERTZ_PER_MEGAHERTZ : UInt64 = 10000000
    static let DECIHERTZ_PER_KILOHERTZ : UInt64 = 10000
    static let DECIHERTZ_PER_HERTZ : UInt64 = 10

    static func decihertzWithMegahertz(megahertz: UInt64, kilohertz: UInt64) -> UInt64 {
        return decihertzWithMegahertz(megahertz, kilohertz: kilohertz, hertz: 0)
    }

    static func decihertzWithMegahertz(megahertz: UInt64, kilohertz: UInt64, hertz: UInt64) -> UInt64 {
        return megahertz * FrequencyConverter.DECIHERTZ_PER_MEGAHERTZ
            + kilohertz * FrequencyConverter.DECIHERTZ_PER_KILOHERTZ
            + hertz * FrequencyConverter.DECIHERTZ_PER_HERTZ;
    }
    
}