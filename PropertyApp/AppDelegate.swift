//
//  AppDelegate.swift
//  PropertyApp
//
//  Created by Bharti Sharma on 08/01/18.
//  Copyright © 2018 Bharti Sharma. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        guard let splitViewController = window?.rootViewController as? UISplitViewController else{
//            return true
//        }
        guard let splitViewController = window?.rootViewController as? UISplitViewController,
            let leftNavController = splitViewController.viewControllers.first as? UINavigationController,
            let masterViewController = leftNavController.topViewController as? PropertyViewController,
            let rightNavController = splitViewController.viewControllers.last as? UINavigationController,
            let detailViewController = rightNavController.topViewController as? PropertyDetailViewController
            else { fatalError() }
        
        splitViewController.delegate = self
        
        masterViewController.delegate = detailViewController
        
        detailViewController.navigationItem.leftItemsSupplementBackButton = true
        detailViewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    //MARK:- Delegate Method
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        
        if let navController = secondaryViewController as? UINavigationController{
            if let detailVC = navController.topViewController as? PropertyDetailViewController{
                if detailVC.property != nil{
                    return false
                }
            }
        }
        return true
    }
// func primaryViewController(forCollapsing splitViewController: UISplitViewController) -> UIViewController? {
//        <#code#>
//    }
//    - (BOOL)splitViewController:(UISplitViewController *)splitViewController
//    collapseSecondaryViewController:(UIViewController *)secondaryViewController
//    ontoPrimaryViewController:(UIViewController *)primaryViewController {
//
//    if ([secondaryViewController isKindOfClass:[UINavigationController class]]
//    && [[(UINavigationController *)secondaryViewController topViewController] isKindOfClass:[DetailViewController class]]
//    && ([(DetailViewController *)[(UINavigationController *)secondaryViewController topViewController] detailItem] == nil)) {
//
//    // Return YES to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
//    return YES;
//
//    } else {
//
//    return NO;
//
//    }
//    }

}

