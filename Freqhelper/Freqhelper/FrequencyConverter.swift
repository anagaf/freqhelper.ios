//
//  FrequencyConverter.swift
//  Freqhelper
//
//  Created by Andrey Agafonov on 24/10/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import Foundation

class FrequencyConverter {
    static let DECIHERTZ_PER_MEGAHERTZ = 10000000
    static let DECIHERTZ_PER_KILOHERTZ = 10000
    static let DECIHERTZ_PER_HERTZ = 10

    static func decihertzWithMegahertz(megahertz: Int, kilohertz: Int) -> Int {
        return decihertzWithMegahertz(megahertz, kilohertz: kilohertz, hertz: 0)
    }

    static func decihertzWithMegahertz(megahertz: Int, kilohertz: Int, hertz: Int) -> Int {
        return megahertz * DECIHERTZ_PER_MEGAHERTZ
            + kilohertz * DECIHERTZ_PER_KILOHERTZ
            + hertz * DECIHERTZ_PER_HERTZ;
    }
    
}