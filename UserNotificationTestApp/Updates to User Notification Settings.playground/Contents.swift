/*:
 # 3 Updates to User Notification Management
 
 [SUMMARY]
 
 ## 1. Provisional & Critical Notifications
 
 iOS 12 includes two new notifications settings:
 
 *Provisional Authorization*
 
 An optional trial period where users recieve a taste of your app's push notifications before deciding whether to perminately recieve them.
 
 By default,
 
 *Critical Notifications*
 
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
