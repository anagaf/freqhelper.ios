//
//  ChannelViewController.swift
//  Freqhelper
//
//  Created by anagaf on 19/10/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import UIKit

class ChannelsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, ChannelCellListener {

    @IBOutlet weak var mhzField: FHTextField!
    @IBOutlet weak var khzField: FHTextField!
    @IBOutlet weak var hzField: FHTextField!
    
    @IBOutlet weak var channelsTable: UITableView!
    
    let ranges : [Range] = [
        Lpd69(),
        Lpd8()
    ]
    
    var value : UInt64 {
        let mhz = UInt64(self.mhzField.text ?? "0")
        let khz = UInt64(self.khzField.text ?? "0")
        let hz = UInt64(self.hzField.text ?? "0")
        return FrequencyConverter.decihertzWithMegahertz(mhz!, kilohertz: khz!, hertz: hz!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mhzField.delegate = self
        self.khzField.delegate = self
        self.hzField.delegate = self
        
        let numpadToolbar = UIToolbar()

        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("hideNumpad"))
        
        numpadToolbar.setItems([spacer, doneButton], animated: false)
        numpadToolbar.sizeToFit()
        
        self.mhzField.inputAccessoryView = numpadToolbar
        self.khzField.inputAccessoryView = numpadToolbar
        self.hzField.inputAccessoryView = numpadToolbar
        
        self.channelsTable.dataSource = self
        self.channelsTable.delegate = self

        self.updateValue()
    }
    
    func hideNumpad() {
        // TODO
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateValue() {
        var value = Settings.channelFrequency
        if (value == 0) {
            value = Lpd69().values[0]
            Settings.channelFrequency = value
        }
        
        self.mhzField.text = String(FrequencyConverter.megahertzComponent(value))
        self.khzField.text = String(FrequencyConverter.kilohertzComponent(value))
        self.hzField.text = String(FrequencyConverter.hertzComponent(value))
        
        self.channelsTable.reloadData()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.ranges.count
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("channel", forIndexPath: indexPath) as! ChannelCell
        
        cell.listener = self
        
        let range = self.ranges[indexPath.section]
        
        cell.update(range, value: self.value)
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section > 0 ? 10.0 : 0
    }

    func textFieldDidEndEditing(textField: UITextField) {
        if (textField === self.mhzField || textField === self.khzField || textField === self.hzField) {
            Settings.channelFrequency = self.value;
            self.channelsTable.reloadData()
        }
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let newLength = textField.text!.characters.count - range.length + string.characters.count
        if (newLength > 3) {
            return false;
        }
        
        let inverseSet = NSCharacterSet.decimalDigitCharacterSet().invertedSet
        let components = string.componentsSeparatedByCharactersInSet(inverseSet)
        let filtered = components.joinWithSeparator("")
        return string == filtered;
    }
    
    func didChangeChannel(range: Range, channel: Int) {
        Settings.channelFrequency = range.values[channel]
        self.updateValue()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
