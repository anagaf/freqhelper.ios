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
    
    static var channelFrequency : UInt64 {
        get {
            let value = NSUserDefaults.standardUserDefaults().objectForKey(channelFrequencyKey)
            if (value == nil) {
                return 0
            } else {
                return value!.unsignedLongLongValue
            }
        }
        set(newValue) {
            NSUserDefaults.standardUserDefaults().setObject(NSNumber(unsignedLongLong: newValue), forKey: channelFrequencyKey)
        }
    }
}