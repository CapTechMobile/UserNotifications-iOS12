//
//  AppDelegate.swift
//  UserNotificationTestApp
//
//  Created by Ragan Walker on 6/8/18.
//  Copyright © 2018 SillyRags. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        registerForNotificationsWithApplication(application)
        return true
    }

    func registerForNotificationsWithApplication(_ application: UIApplication) {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.delegate = self
        
        // Request authorization.
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge, .provisional]) { _, error in
            if let error = error {
                fatalError("failed to get authorization for notifications with \(error)")
            }
        }
        
        // Set up categories.
//        let testCategory = UNNotificationCategory(identifier: "testCategory", actions: [], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: "You've received %u notifications", options: [])

        let testCategory = UNNotificationCategory(identifier: "testCategory", actions: [], intentIdentifiers: [], hiddenPreviewsBodyPlaceholder: NSString.localizedUserNotificationString(forKey: "NOTIF_PREVIEW", arguments: nil), categorySummaryFormat: NSString.localizedUserNotificationString(forKey: "NOTIF_SUMMARY", arguments: nil), options: [])
        notificationCenter.setNotificationCategories([testCategory])
        
        // Register for push notifications.
        application.registerForRemoteNotifications()
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Push notifications registration failed with \(error)")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Allowing banners to show up in the app.
        completionHandler(.alert)
    }
}

