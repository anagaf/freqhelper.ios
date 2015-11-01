//
//  ChannelViewController.swift
//  Freqhelper
//
//  Created by anagaf on 19/10/15.
//  Copyright © 2015 anagaf. All rights reserved.
//

import UIKit

class ChannelsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var mhzField: TileTextField!
    @IBOutlet weak var khzField: TileTextField!
    @IBOutlet weak var hzField: TileTextField!
    
    @IBOutlet weak var channelsTable: UITableView!
    
    let ranges : [Range] = [
        Lpd69(),
        Lpd8()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateValue()
        
        channelsTable.dataSource = self
        channelsTable.delegate = self
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
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ranges.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("channel", forIndexPath: indexPath) as! ChannelCell
        
        cell.name.text = self.ranges[indexPath.row].name
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {        
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
