//
//  AppDelegate.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        bootstrap()
        return true
    }
    
    private func bootstrap() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let router = AppBootstrapRouter()
        router.bootstrap(in: window, root: UINavigationController())
        self.window = window
    }
}

