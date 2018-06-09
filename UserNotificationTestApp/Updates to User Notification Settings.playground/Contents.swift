/*:
 # 3 Updates to User Notification Management in iOS 12
 
 [SUMMARY]
 
 ## 1. Provisional & Critical Notifications
 
Apple introduced Critical Notifications to deliver top priority information to phones. If you are numb to the vibration of your phone, from the exhausting amount of notifications, you will appreciate this iOS 12 feature. Critical alerts, such as those about health, safety, and security, will override your phone's quiet settings, to make users aware of the notification. These alerts are designed to be disruptive. The notification can play custom sounds loudly, and bypass “Do not Disturb Mode” and silenced phone ringers.
 
Wait! Does this mean my dating app notifications will blare out while I’m at church? No, you won’t have to worry about that. Apple has to grant special privileges to apps, and has to consider the information as top priority, to approve notifications of this type. It’s at Apple’s discretion to allow apps to ask users to enroll in Critical Notifications.

*How Do I Enroll my App?*

 Note: you do not need to enroll your app for testing or personal use of Critical Notifications.
 Note: only developer profiles which are assigned the role of Team Agent can request entitlements.
 
 Navigate to the entitlement request page [link] (https://developer.apple.com/contact/kext/). You will then have to provide justification for the use of Critical notifications, including answering: "Which user mode APIs were investigated, and why were they not sufficient?". From there, the request to obtain the certificate will be reviewed by Apple.
 
 
 
 **Provisional Authorization**
 
 ```swift
 UNAuthorizationOptions.provisional
 ```
 An optional trial period where users recieve a taste of your app's push notifications before deciding whether to perminately recieve them. This is an opt-in setting that you provide along with other `UNAuthorizationOptions` (`.badge`, `.sound`, or `.alert`) when requesting notification authorization.
 
 *What You Need to Know*
 
- If `.provisional` is specified, push notificaitons are automatically enabled and the user will not be prompted on initial app launch to accept push notifications
- By default, notifications sent under provisional authorization are "quiet" notifications, in that they only appear on the Notification Center, and do not play sound
- Users may opt-in to "loud" notifications by tapping on the notification to see a prompt to accept or deny regular notifications
- The length of the trial period for notificaitons is determined by the system
- At the end of the trial period, users will be prompted to accept regular notifications on app launch if they haven't already accepted through a "quiet" notification

 *Implications*
 
 Users often opt out of notifications, not knowing what they are signing up for. This features allows users to get a taste for your notifications before being presentied with a choice to accept them on full blast.
 
 One consideration that you must make when deciding whether to implement this feature is whether users will notification is the amount of time it takes to be prompted for full notifications. It may be easy to ignore notifications in the notification center.
 The types of notifications that you are sending through provisional--if you only send badge or sound, this does not apply
 
 
 **Critical Notifications**
 
 **How Do You Add These to Your App?**
 Both of these can be set using new `UNAuthorizationOptions` values available on the NotificationCenter [request authorization API method](https://developer.apple.com/documentation/usernotifications/unusernotificationcenter/1649527-requestauthorization):
 ```swift
 func requestAuthorization(options: UNAuthorizationOptions = [],
    completionHandler: @escaping (Bool, Error?) -> Void)
 ```
 These values are set along side your existing `UNAuthorizationOptions`:
 ```swift
 UNUserNotificationCenter.current().requestAuthorization(
    options:[.badge, .alert, .provisional]) { (success, error) -> () in
        //authorization complete
    }
 ```
 
 ## 2. Grouped Notifications
  _Notes:_ Grouped notifications need to inlcude summary strings, and localiztaion
 
 ## 3. Custom Notification Settings

 */
