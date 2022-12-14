//
//  AppDelegate.swift
//  challenge-thefork
//
//  Created by Kevin Alan Furman on 04/12/2022.
//

import UIKit

@UIApplicationMain
class AppDelegate : UIResponder, UIApplicationDelegate {
    
    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
            if #available(iOS 13, *) {
                // do only pure app launch stuff, not interface stuff
            } else {
                self.window = UIWindow()
                
                let vc = RestaurantListView(presenter: RestaurantListPresenter())
                let navigationController = UINavigationController()
                navigationController.viewControllers = [vc]
                
                self.window!.rootViewController = navigationController
                self.window!.makeKeyAndVisible()
            }
            return true
    }
}
