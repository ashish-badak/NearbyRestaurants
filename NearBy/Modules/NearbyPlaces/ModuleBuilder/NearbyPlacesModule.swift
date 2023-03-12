//
//  NearbyPlacesModule.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import UIKit

final class NearbyPlacesModule {
    // - TODO: Accept dependancies inside build method as parameters
    func build() -> UIViewController {
        let router = NearbyPlacesRouter()
        let interactor = NearbyPlacesInteractor()
        let presenter = NearbyPlacesPresenter(
            interactor: interactor,
            router: router
        )
        let controller = NearbyPlacesViewController(presenter: presenter)
        presenter.view = controller
        return controller
    }
}
