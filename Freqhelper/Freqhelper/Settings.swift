//
//  Settings.swift
//  Freqhelper
//
//  Created by anagaf on 30/10/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import Foundation

class Settings {
    
    static let channelFrequencyKey : String = "ChannelFrequency"
    
    static var channelFrequency : Frequency {
        get {
            let decihertzValue = NSUserDefaults.standardUserDefaults().objectForKey(channelFrequencyKey)
            if (decihertzValue == nil) {
                return Frequency()
            } else {
                return Frequency(decihertz : decihertzValue!.unsignedLongLongValue)
            }
        }
        set(newFrequency) {
            NSUserDefaults.standardUserDefaults().setObject(NSNumber(unsignedLongLong: newFrequency.decihertz), forKey: channelFrequencyKey)
        }
    }
}