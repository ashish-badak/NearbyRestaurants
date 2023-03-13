//
//  NearbyBusinessesModule.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import UIKit

final class NearbyBusinessesModule {
    // - TODO: Accept dependancies inside build method as parameters
    func build(navigationController: UINavigationController) -> UIViewController {
        let router = NearbyBusinessesRouter()
        let interactor = NearbyBusinessesInteractor(
            businessType: "restaurants",
            latitude: 37.786882,
            longitude: -122.399972
        )
    
        let presenter = NearbyBusinessesPresenter(
            interactor: interactor,
            router: router
        )
        
        let controller = NearbyBusinessesViewController(presenter: presenter)
        presenter.view = controller
        router.navigationController = navigationController
        return controller
    }
}
