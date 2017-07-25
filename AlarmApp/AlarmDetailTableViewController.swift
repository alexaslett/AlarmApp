//
//  AlarmDetailTableViewController.swift
//  AlarmApp
//
//  Created by Alex Aslett on 7/24/17.
//  Copyright © 2017 One Round Technology. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {

    var alarm: Alarm? {
        didSet {
            if isViewLoaded {
                updateViews()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    // MARK: - UpdateViews Function
    
    private func  updateViews(){
        guard let alarm = alarm, let thisMorningAtMidnight = DateHelper.thisMorningAtMidnight,
        isViewLoaded else { disableButton.isHidden = true
            return
    }
        datePicker.setDate(Date(timeInterval: alarm.fireTimeFromMidnight, since:thisMorningAtMidnight), animated: false)
        alarmLabel.text = alarm.name
        
        disableButton.isHidden = false
        if alarm.enabled {
            disableButton.setTitle("Disable", for: UIControlState())
            disableButton.setTitleColor(.white, for: UIControlState())
            disableButton.backgroundColor = .red
        } else {
            disableButton.setTitle("Enable", for: UIControlState())
            disableButton.setTitleColor(.blue, for: UIControlState())
            disableButton.backgroundColor = .gray
        }
        
        self.title = alarm.name
        
    }
    
    
    // MARK: - IBOutlets and IBActions
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var alarmLabel: UITextField!
    @IBOutlet weak var disableButton: UIButton!
    
    @IBAction func disableButtonTapped(_ sender: Any) {
        guard let alarm = alarm else { return }
        AlarmController.shared.toggleEnabled(for: alarm)
        updateViews()
        }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = alarmLabel.text, let thisMorningAtMidnight = DateHelper.thisMorningAtMidnight else { return }
        let timeIntervalSinceMidnight = datePicker.date.timeIntervalSince(thisMorningAtMidnight)
        if let alarm = alarm {
            AlarmController.shared.update(alarm: alarm, fireTimeFromMidnight: timeIntervalSinceMidnight, name: title)
        } else {
        let alarm = AlarmController.shared.addAlarm(fireTimeFromMidnight: timeIntervalSinceMidnight, name: title)
        self.alarm = alarm
        }
        let _ = navigationController?.popViewController(animated: true)
    }
    





}
