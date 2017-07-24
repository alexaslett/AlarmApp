//
//  SwitchTableViewCell.swift
//  AlarmApp
//
//  Created by Alex Aslett on 7/24/17.
//  Copyright © 2017 One Round Technology. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {
    

    var alarm: Alarm? {
        didSet{
            updateViews(with: alarm)
        }
    }
    
    

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
   
   
    @IBAction func switchValueChanged(_ sender: Any) {
    }
    
    // MARK: - Lifecycle
    
    func updateViews(with alarm: Alarm? ) {
        guard let alarm = alarm else { return }
        timeLabel.text = alarm.fireTimeAsString
        nameLabel.text = alarm.name
        alarmSwitch.isOn = alarm.enabled
        
    }

    
    
}
