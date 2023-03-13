//
//  NearbyPlacesModule.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import UIKit

final class NearbyPlacesModule {
    // - TODO: Accept dependancies inside build method as parameters
    func build(navigationController: UINavigationController) -> UIViewController {
        let router = NearbyPlacesRouter()
        let interactor = NearbyPlacesInteractor(
            placeType: "restaurants",
            latitude: 37.786882,
            longitude: -122.399972
        )
    
        let presenter = NearbyPlacesPresenter(
            interactor: interactor,
            router: router
        )
        
        let controller = NearbyPlacesViewController(presenter: presenter)
        presenter.view = controller
        router.navigationController = navigationController
        return controller
    }
}
