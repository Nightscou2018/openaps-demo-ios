//
//  AppDelegate.swift
//  OpenAPS Demo
//
//  Created by Nathan Racklyeft on 5/7/16.
//  Copyright © 2016 Nathan Racklyeft. All rights reserved.
//

import UIKit

let fixtures = [
    (htmlFile: "2016-05-04_1951_hannemannopenaps.html", icon: "tab-a", title: "Dinner"),
    (htmlFile: "2016-01-15_0357_naterade.html", icon: "tab-b", title: "Post-Dinner"),
    (htmlFile: "2016-02-04_0938_hiAtBed_perfectAM.html", icon: "tab-c", title: "Overnight"),
//    (htmlFile: "2016-01-19_0657_naterade.html", icon: "tab-c", title: "Overnight"),
    (htmlFile: "2016-02-21_0530_naterade.html", icon: "tab-d", title: "Dawn"),
    (htmlFile: "2016-05-13_1536_markps.html", icon: "tab-e", title: "Lunch"),
//    (htmlFile: "2016-01-17_1422_naterade.html", icon: "tab-e", title: "Lunch"),
]

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        window?.backgroundColor = UIColor.whiteColor()

        dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0)) { 
            let fileManager = NSFileManager.defaultManager()

            if let HTMLDirectory = fileManager.HTMLDirectory, HTMLResources = NSBundle.mainBundle().HTMLResources {
                do {
                    try fileManager.removeItemAtURL(HTMLDirectory)
                } catch {
                    // Continue on!
                }

                try! fileManager.copyItemAtURL(HTMLResources, toURL: HTMLDirectory)
            }

            dispatch_async(dispatch_get_main_queue()) {
                if let tabBarController = self.window?.rootViewController as? UITabBarController {

                    var viewControllers: [UIViewController] = []

                    for fixture in fixtures {
                        let webViewController = WebViewViewController()
                        webViewController.fileName = fixture.htmlFile
                        webViewController.tabBarItem = UITabBarItem(title: fixture.title, image: UIImage(named: fixture.icon), selectedImage: UIImage(named: "\(fixture.icon)-selected"))

                        viewControllers.append(webViewController)
                    }


                    tabBarController.viewControllers = viewControllers
                }
            }
        }

        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

