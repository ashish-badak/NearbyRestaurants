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
    func businessDidTap(at index: Int)
    func getNumberOfViewModels() -> Int
    func getViewModel(atIndex index: Int) -> NearbyBusinessViewModel
}

protocol NearbyBusinessesRouterProtocol: AnyObject {
    func routeToBusinessDetailsScreen(businessId: String, businessName: String)
}
