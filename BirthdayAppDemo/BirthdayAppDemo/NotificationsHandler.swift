//
//  NotificationsHandler.swift
//  BirthdayAppDemo
//
//  Created by Have Dope on 20.10.2023.
//  Copyright © 2023 DevTechie. All rights reserved.
//

import Foundation
import UserNotifications


class NotificationsHandler {
    func askPermisson(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]) { success, error in
            if success{
                print("ALL GOOD ")
            } else if let error = error {
                print("--> Ошибка: ", error.localizedDescription)
                
            }
        }
    }
    
    func sendNotification(date: Date, type:String, timeInterval: Double = 10, title: String, body: String){
        var trigger: UNNotificationTrigger?
        
        if type == "date"{
            let dateComponents = Calendar.current.dateComponents([.day,.year,.hour,.minute], from: date)
            trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        }else if type == "time"{
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
            
        }
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger )
        UNUserNotificationCenter.current().add(request)
        }
}