//
//  BusinessDetailsModule.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import UIKit

final class BusinessDetailsModule {
    func build(businessId: String, businessName: String) -> UIViewController {
        let interactor = BusinessDetailInteractor(businessId: businessId)
        let presenter = BusinessDetailsPresenter(interactor: interactor)
        let controller = BusinessDetailsViewController(presenter: presenter)
        presenter.view = controller
        controller.title = businessName
        return controller
    }
}
