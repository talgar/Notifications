//
//  Model.swift
//  ListOfPlan
//
//  Created by admin on 20.06.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import UserNotifications

class Items : Object {
    @objc dynamic  var name = ""
    @objc dynamic var date : Date = Date()
    @objc dynamic var completed = false
}


func setNotification(item:Items) {

    let content = UNMutableNotificationContent()
    content.title = "DO NOT FORGET:"
    content.body =  item.name
    content.sound = UNNotificationSound.default
    
    let targetDate = item.date
    let trigger = UNCalendarNotificationTrigger(dateMatching:Calendar.current.dateComponents([.year, .month, .day, .hour, .minute],from: targetDate),repeats: false)
    
    let reguest = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
    
    UNUserNotificationCenter.current().add(reguest) { (error) in
        print(error?.localizedDescription as Any)
    }
}
