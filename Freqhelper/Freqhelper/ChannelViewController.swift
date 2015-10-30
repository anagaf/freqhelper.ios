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
        var frequency = Settings.channelFrequency
        if (!frequency.isValid()) {
            frequency = Frequency(decihertz: Lpd69().values[1])
            Settings.channelFrequency = frequency
        }
        
        self.mhzField.text = String(frequency.megahertzComponent)
        self.khzField.text = String(frequency.kilohertzComponent)
        self.hzField.text = String(frequency.hertzComponent)
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
