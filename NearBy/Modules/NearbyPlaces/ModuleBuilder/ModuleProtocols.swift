//
//  ModuleProtocols.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import Foundation

protocol NearbyPlacesViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    func showError(message: String)
    func showNearbyPlaces()
}

protocol NearbyPlacesInteractorProtocol: AnyObject {
    func fetchNearbyPlaces() async -> Result<[Business], Error>
}

protocol NearbyPlacesPresenterProtocol: AnyObject {
    // - TODO: Define presenter requirements
}

protocol NearbyPlacesRouterProtocol: AnyObject {
    // - TODO: Define router requirements
}
