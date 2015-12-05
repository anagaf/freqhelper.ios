//
//  ChannelCell.swift
//  Freqhelper
//
//  Created by Andrey Agafonov on 01/11/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import Foundation
import UIKit

protocol ChannelCellListener {
    func didChangeChannel(range:Range, channel:Int)
}

class ChannelCell : UITableViewCell {

    @IBOutlet weak var channel: TileTextField!
    @IBOutlet weak var name: FHLabel!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var listener: ChannelCellListener?
    
    private var range : Range!
    
    private var prevChannel: Int?
    private var nextChannel: Int?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func update(range: Range, value: UInt64) {
        NSLog("Update %s cell with value %ld", range.name, value)

        self.range = range
        self.name.text = range.name

        if let channelIndex = range.find(value) {
            channel.text = String(channelIndex + 1)
            NSLog("-- channel %d", channelIndex)
        } else {
            channel.text = ""
        }
        
        self.prevChannel = self.range.findPrev(value)
        if prevChannel != nil {
            NSLog("-- prev channel %d", prevChannel!)
        }
        self.prevButton.enabled = (self.prevChannel != nil)
        
        self.nextChannel = self.range.findNext(value)
        if nextChannel != nil {
            NSLog("-- next channel %d", nextChannel!)
        }
        self.nextButton.enabled = (self.nextChannel != nil)
        
    }

    @IBAction func didPressPrev(sender: AnyObject) {
        self.listener?.didChangeChannel(self.range, channel: self.prevChannel!)
    }

    @IBAction func didPressNext(sender: AnyObject) {
        self.listener?.didChangeChannel(self.range, channel: self.nextChannel!)
    }
}