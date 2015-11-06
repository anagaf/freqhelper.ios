//
//  ChannelCell.swift
//  Freqhelper
//
//  Created by Andrey Agafonov on 01/11/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import Foundation
import UIKit

protocol ChannelCellDelegate {
    func onPrevClicked()
    func onNexClicked()
}

class ChannelCell : UITableViewCell {

    @IBOutlet weak var channel: TileTextField!
    @IBOutlet weak var name: TitleLabel!
    
    private var range : Range!
    
    func update(range: Range, value: UInt64) {
        self.range = range
        self.name.text = range.name

        if let channelIndex = range.find(value) {
            channel.text = String(channelIndex + 1)
        } else {
            channel.text = ""
        }
    }
}