//
//  ChannelViewController.swift
//  Freqhelper
//
//  Created by anagaf on 19/10/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import UIKit

class ChannelsViewController: UIViewController {

    @IBOutlet weak var mhzField: TileTextField!
    @IBOutlet weak var khzField: TileTextField!
    @IBOutlet weak var hzField: TileTextField!
    
    @IBOutlet weak var channelsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateValue()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateValue() {
        var value = Settings.channelFrequency
        if (value == 0) {
            value = Lpd69().values[1]
            Settings.channelFrequency = value
        }
        
        self.mhzField.text = String(FrequencyConverter.megahertzComponent(value))
        self.khzField.text = String(FrequencyConverter.kilohertzComponent(value))
        self.hzField.text = String(FrequencyConverter.hertzComponent(value))
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
