//
//  AlarmController.swift
//  AlarmApp
//
//  Created by Alex Aslett on 7/24/17.
//  Copyright © 2017 One Round Technology. All rights reserved.
//

import Foundation


class AlarmController {
    
    static let shared = AlarmController()
    
    var alarms: [Alarm] = []
    
    var mockAlarms: [Alarm] {
        let wakeUp = Alarm(fireTimeFromMidnight: 1450.0, name: "Wake Up")
        let lunchTime = Alarm(fireTimeFromMidnight: 150.0, name: "Lunch Time")
        let sleepTime = Alarm(fireTimeFromMidnight: 3473.0, name: "Sleep Time")
        let anotherTime = Alarm(fireTimeFromMidnight: 3432.0, name: "Another Time", enabled: false)
        
        return [wakeUp, lunchTime, sleepTime, anotherTime]
    }
    
    //C
    func addAlarm(fireTimeFromMidnight: TimeInterval, name: String) -> Alarm {
        let alarm = Alarm(fireTimeFromMidnight: fireTimeFromMidnight, name: name)
        alarms.append(alarm)
        return alarm
    }
    
    
    
    //R
    
    
    
    
    //U
    func update(alarm: Alarm, fireTimeFromMidnight: Double, name: String){
        guard let indexPath = alarms.index(of: alarm) else { return }
        alarms[indexPath].fireTimeFromMidnight = fireTimeFromMidnight
        alarms[indexPath].name = name
    }
    
    
    
    //D
    func delete(index: Int){
        alarms.remove(at: index)
    }
    
    func toggleEnabled(for alarm: Alarm){
        alarm.enabled = !alarm.enabled
    }
    
    
}
