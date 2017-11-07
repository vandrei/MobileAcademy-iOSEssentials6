//
//  AppDelegate.swift
//  weatherwake
//
//  Created by Andrei Vasilescu on 31/03/16.
//  Copyright © 2016 mready. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        let userDefaults = UserDefaults.standard
        if var openCount = userDefaults.value(forKey: "app_open") as? Int {
            openCount += 1
            userDefaults.setValue(openCount, forKey: "app_open")
            print("App was openened \(openCount) times")
        } else {
            userDefaults.setValue(1, forKey: "app_open")
        }
        
        /* TODO: Uncomment this after creating CoreData Models
         
         DayDA.createWeekdaysIfNecessary()
         AlarmManager.disableExpiredAlarms()
        */
        
        // TODO: If launchOptions != nil, it means the user opened the app from a notification
        // TODO: Handle the notification with NotificationsHandler class
        
        // TODO: Register for Push Notifications
        // TODO: Register for Local Notifications
        // TODO: Init 3rd Party Libraries

        return true
    }
    
    func application(_ application: UIApplication, didReceive notification: UILocalNotification) {
        NotificationsHandler.didOpenNotification(window!)
    }
    
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, completionHandler: @escaping () -> Void) {
        NotificationsHandler.didSelectSnoozeOnNotification(notification)
    }
    
    func application(_ application: UIApplication, handleActionWithIdentifier identifier: String?, for notification: UILocalNotification, withResponseInfo responseInfo: [AnyHashable: Any], completionHandler: @escaping () -> Void) {
        NotificationsHandler.didSelectSnoozeOnNotification(notification)
    }
}

