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
    func didPressPrev()
    func didPressNext()
}

class ChannelCell : UITableViewCell {

    @IBOutlet weak var channel: TileTextField!
    @IBOutlet weak var name: TitleLabel!
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
        self.range = range
        self.name.text = range.name

        if let channelIndex = range.find(value) {
            channel.text = String(channelIndex + 1)
        } else {
            channel.text = ""
        }
        
        self.prevChannel = self.range.findPrev(value)
        self.prevButton.enabled = (self.prevChannel != nil)
        
        self.nextChannel = self.range.findNext(value)
        self.nextButton.enabled = (self.nextButton != nil)
    }

    @IBAction func didPressPrev(sender: AnyObject) {
        self.listener?.didPressPrev()
    }

    @IBAction func didPressNext(sender: AnyObject) {
        self.listener?.didPressNext()
    }    
}