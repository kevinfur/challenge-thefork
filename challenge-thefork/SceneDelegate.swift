//
//  SceneDelegate.swift
//  challenge-thefork
//
//  Created by Kevin Alan Furman on 04/12/2022.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window : UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            if let windowScene = scene as? UIWindowScene {
                self.window = UIWindow(windowScene: windowScene)
                
                let vc = RestaurantListView(presenter: RestaurantListPresenter())
                let navigationController = UINavigationController()
                navigationController.viewControllers = [vc]
                
                self.window!.rootViewController = navigationController
                self.window!.makeKeyAndVisible()
            }
    }
}
