/*:
 # 3 Updates to User Notification Management in iOS 12
 
 [SUMMARY]
 
 ## 1. Provisional & Critical Notifications
 
 iOS 12 includes two new notifications settings:
 
 **Provisional Authorization**
 
 ```swift
 UNAuthorizationOptions.provisional
 ```
 
 An optional trial period where users recieve a taste of your app's push notifications before deciding whether to perminately recieve them. This is an opt-in setting that you provide along with your other `UNAuthorizationOptions` (`.badge`, `.sound`, or `.alert`) when requesting notification authorization.
 
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
