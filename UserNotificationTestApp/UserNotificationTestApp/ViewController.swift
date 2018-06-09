//
//  ViewController.swift
//  UserNotificationTestApp
//
//  Created by Ragan Walker on 6/8/18.
//  Copyright © 2018 SillyRags. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    @IBOutlet weak var alert1: UIButton!
    @IBOutlet weak var alert2: UIButton!

    @IBAction func sendLocalNotificationWithAttachment(_ sender: Any) {
        let content = UNMutableNotificationContent()
        
        guard let sender = sender as? UIButton else { return }
        // Set title and subtitle.
        content.title = sender == alert1 ? "Fluffy": "Tiger"
        content.body = "Incoming notification coming your way. This is important."
//        content.sound = UNNotificationSound.defaultCritical
        
        if let fileURL = Bundle.main.url(forResource:sender == alert1 ? "fluffy": "tiger", withExtension: "jpeg"),
            let attachment = try? UNNotificationAttachment(identifier: "localAttachment", url: fileURL, options: nil) {
            content.attachments = [attachment]
        }
        content.categoryIdentifier = "testCategory"
        
        // Send notification after 5 seconds.
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        
        // Set up notification request.
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        // Schedule notification request.
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                fatalError("failed to schedule notification request: \(request) with \(error)")
            }
        }
    }

}

