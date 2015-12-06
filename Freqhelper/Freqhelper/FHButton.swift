//
//  FHButton.swift
//  Freqhelper
//
//  Created by Andrey Agafonov on 06/12/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import Foundation
import UIKit

class FHButton : UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
    }
    
    override var enabled: Bool {
        get {
            return super.enabled
        }
        set {
            if newValue {
                backgroundColor = FHStyle.rangeItemColor
            }
            else {
                backgroundColor = FHStyle.rangeItemDisabledColor
            }
            super.enabled = newValue
        }
    }}