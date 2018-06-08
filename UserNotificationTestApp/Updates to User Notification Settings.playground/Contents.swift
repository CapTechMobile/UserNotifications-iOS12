/*:
 # 3 Updates to User Notification Management in iOS 12
 
 [SUMMARY]
 
 ## 1. Provisional & Critical Notifications
 
 Apple introduced Critical Notifications, a way to deliver top priority information to users. If you are numb to the vibration of your phone, from receiving an exhausting amount of notifications, you will appreciate this iOS 12 feature. Critical alerts, such as those about health, safety, and security, will override your phone's quiet settings to make you aware of the notification. These alerts will be loud and clear, and are designed to bypass “Do not Disturb Mode” and silenced phone ringers.
 
Wait! Does this mean my Tinder notifications will blare out while I’m at church? No, you won’t have to worry about that.  Apple has to grant special privileges to apps, and has to consider the information as top priority, to approve notifications of this type. It’s at Apple’s discretion to allow apps to ask users to enroll in Critical Notifications.
 
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
