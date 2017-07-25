//
//  SwitchTableViewCell.swift
//  AlarmApp
//
//  Created by Alex Aslett on 7/24/17.
//  Copyright © 2017 One Round Technology. All rights reserved.
//

import UIKit

protocol SwitchTableViewCellDelegate: class {
    func switchCellSwitchValueChanged(cell: SwitchTableViewCell)
}


class SwitchTableViewCell: UITableViewCell {
    

    var alarm: Alarm? {
        didSet{
            updateViews()
        }
    }
    
    // MARK: - IBOutlets and IBActions

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
   
   
    @IBAction func switchValueChanged(_ sender: Any) {
        delegate?.switchCellSwitchValueChanged(cell: self)
    }
    
    // MARK: - Internal Properties
    
    weak var delegate: SwitchTableViewCellDelegate?
    
    // MARK: - Lifecycle
    
    func updateViews() {
        guard let alarm = alarm else { return }
        timeLabel.text = alarm.fireTimeAsString
        nameLabel.text = alarm.name
        alarmSwitch.isOn = alarm.enabled
        
    }

    
    
}
