//
//  AppDelegate.swift
//  Image-unsplash-exercice
//
//  Created by Zakaria Elmoutassim on 15/10/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let storyboard = UIStoryboard(name: "SearchView", bundle: nil)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
        window?.makeKeyAndVisible()
        return true
    }
}

