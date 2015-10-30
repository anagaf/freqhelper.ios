//
//  Frequency.swift
//  Freqhelper
//
//  Created by Andrey Agafonov on 24/10/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import Foundation

struct Frequency {
    static let DECIHERTZ_PER_MEGAHERTZ : UInt64 = 10000000
    static let DECIHERTZ_PER_KILOHERTZ : UInt64 = 10000
    static let DECIHERTZ_PER_HERTZ : UInt64 = 10
    
    let decihertz : UInt64

    init() {
        self.decihertz = 0
    }
    
    init(decihertz : UInt64) {
        self.decihertz = decihertz
    }
    

    var megahertzComponent : Int {
        return Int(self.decihertz / Frequency.DECIHERTZ_PER_MEGAHERTZ);
    }
    
    var kilohertzComponent : Int {
        return Int(self.decihertz % Frequency.DECIHERTZ_PER_MEGAHERTZ / Frequency.DECIHERTZ_PER_KILOHERTZ)
    }
    
    var hertzComponent : Int {
        return Int(self.decihertz % Frequency.DECIHERTZ_PER_KILOHERTZ / Frequency.DECIHERTZ_PER_HERTZ)
    }
    
    func isValid() -> Bool {
        return self.decihertz > 0
    }
}