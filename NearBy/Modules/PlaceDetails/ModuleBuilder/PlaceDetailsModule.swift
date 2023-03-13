//
//  PlaceDetailsModule.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import UIKit

final class PlaceDetailsModule {
    func build(businessId: String, businessName: String) -> UIViewController {
        let interactor = PlaceDetailInteractor(businessId: businessId)
        let presenter = PlaceDetailsPresenter(interactor: interactor)
        let controller = PlaceDetailsViewController(presenter: presenter)
        presenter.view = controller
        controller.title = businessName
        return controller
    }
}
