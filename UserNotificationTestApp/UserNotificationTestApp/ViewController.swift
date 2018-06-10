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
        
        guard let sender = sender as? UIButton else { return }
        // Set title and subtitle.
        
        let content = UNMutableNotificationContent()
        if sender == alert1 { //RETAIL ALERT
            //JORGE: TODO
            content.configure(LocalizedContentConfiguration(
                title: NSLocalizedString("NOTIF_TITLE_RETAIL", comment: "banking"),
                body: NSLocalizedString("NOTIF_BODY_RETAIL", comment: "body text"),
                category: "testCategory",
                identifier: "banking-transfer-notifications",
                summaryArg: NSLocalizedString("NOTIF_TITLE_RETAIL", comment: "banking"),
                summaryCount: nil))
        } else { //BANKING ALERT
            content.configure(LocalizedContentConfiguration(
                title: NSLocalizedString("NOTIF_TITLE_BANKING", comment: "banking"),
                body: NSLocalizedString("NOTIF_BODY_BANKING", comment: "body text"),
                category: "testCategory",
                identifier: "banking-transfer-notifications",
                summaryArg: NSLocalizedString("NOTIF_TITLE_BANKING", comment: "banking"),
                summaryCount: nil))
            
            if let fileURL = Bundle.main.url(forResource:sender == alert1 ? "fluffy": "tiger", withExtension: "jpeg"),
                let attachment = try? UNNotificationAttachment(identifier: "localAttachment", url: fileURL, options: nil) {
                content.attachments = [attachment]
            }
        }

        // Send notification after 5 seconds.
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
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

struct LocalizedContentConfiguration {
    let title: String
    let body: String
    let category: String
    let identifier: String
    let summaryArg: String
    let summaryCount: Int?
}

fileprivate extension UNMutableNotificationContent {
    fileprivate func configure(_ configuration: LocalizedContentConfiguration) {
        self.title = configuration.title
        self.body = configuration.body
        self.categoryIdentifier = configuration.category
        self.threadIdentifier = configuration.identifier
        self.summaryArgument = configuration.summaryArg
        
        if let summaryCount = configuration.summaryCount {
            self.summaryArgumentCount = summaryCount
        }
    }
}

