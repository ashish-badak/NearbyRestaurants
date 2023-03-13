//
//  NearbyBusinessesRouter.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import UIKit

final class NearbyBusinessesRouter: NearbyBusinessesRouterProtocol {
    weak var navigationController: UINavigationController?
    
    func routeToPlaceDetailsScreen(businessId: String, businessName: String) {
        let module = PlaceDetailsModule()
        let controller = module.build(businessId: businessId, businessName: businessName)
        navigationController?.pushViewController(controller, animated: true)
    }
}
