//
//  Settings.swift
//  Freqhelper
//
//  Created by anagaf on 30/10/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import Foundation

class Settings {
    
    let channelFrequencyKey : String = "ChannelFrequency"
    
    var channelFrequency : Frequency {
        get {
            let decihertzValue = NSUserDefaults.standardUserDefaults().integerForKey(channelFrequencyKey)
            return Frequency(decihertz : decihertzValue)
        }
        set(newFrequency) {
            NSUserDefaults.standardUserDefaults().setInteger(newFrequency.decihertz, forKey: channelFrequencyKey)
        }
    }
}