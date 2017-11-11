//
//  AlarmDA.swift
//  weatherwake
//
//  Created by Andrei Vasilescu on 31/03/16.
//  Copyright © 2016 mready. All rights reserved.
//

import Foundation

class AlarmDA: BaseDA {
    fileprivate let DEFAULT_ALARM_NAME = "Untitled"
    fileprivate let DEFAULT_SOUND = "SuperRingtone.caf"
    
    override init() {
        super.init()
        entityName = "Alarm"
    }
    
    func createAlarm() -> Alarm {
        // TODO: Create a CoreData Alarm object
        // TODO: Init object with id, default name, default sound
        let newAlarm = super.create() as! Alarm
        
        newAlarm.id = UUID().uuidString
        newAlarm.name = DEFAULT_ALARM_NAME
        newAlarm.sound = DEFAULT_SOUND
        
        return newAlarm
    }
    
    func getAllAlarms() -> [Alarm] {
        // TODO: Fetch Alarm objects
        let sortDescriptors = [NSSortDescriptor(key: "date", ascending: true),
                               NSSortDescriptor(key: "name", ascending: true)]
        
        return super.fetchObjects(nil, sortDescriptors: sortDescriptors) as! [Alarm]
    }
    
    func getAlarm(_ id:String) -> Alarm? {
        // TODO: Create a predicate for the object. Searched object id should be equal to parameter id
        // TODO: Fecth objects with the predicate
        // TODO: Return first object in found array
        
        let predicate = NSPredicate(format: "self.id = %@", id)
        
        let alarms = super.fetchObjects(predicate, sortDescriptors: nil) as! [Alarm]
        
        return alarms.first
    }
    
    func deleteAlarm(_ alarm:Alarm) {
        super.deleteObject(alarm)
        super.save()
    }
    
    func deleteAllAlarms() {
        super.deleteObjects(getAllAlarms())
        super.save()
    }
}
