//
//  ModuleProtocols.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import Foundation

protocol NearbyBusinessesViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    func showError(message: String)
    func showNearbyBusinesses()
}

protocol NearbyBusinessesInteractorProtocol: AnyObject {
    func fetchNearbyBusinesses() async -> Result<[Business], Error>
    func getBusiness(atIndex index: Int) -> Business
}

protocol NearbyBusinessesPresenterProtocol: AnyObject {
    func viewDidLoad()
    func placeDidTap(at index: Int)
    func getNumberOfViewModels() -> Int
    func getViewModel(atIndex index: Int) -> NearbyPlaceViewModel
}

protocol NearbyBusinessesRouterProtocol: AnyObject {
    func routeToPlaceDetailsScreen(businessId: String, businessName: String)
}
