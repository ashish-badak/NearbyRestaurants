//
//  AppBootstrapRouter.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import UIKit

final class AppBootstrapRouter {
    func bootstrap(in window: UIWindow?, root: UINavigationController) {
        let module = NearbyPlacesModule()
        let controller = module.build()
        root.viewControllers = [controller]
        controller.title = "Nearby Restaurants"
        root.navigationBar.prefersLargeTitles = true
        window?.rootViewController = root
        window?.makeKeyAndVisible()
    }
}
