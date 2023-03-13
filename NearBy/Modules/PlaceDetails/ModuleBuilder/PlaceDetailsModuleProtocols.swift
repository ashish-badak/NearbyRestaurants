//
//  PlaceDetailsModuleProtocols.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

protocol PlaceDetailsViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    func showError(message: String)
    func showPlaceDetails()
}

protocol PlaceDetailsInteractorProtocol: AnyObject {
    func fetchPlaceDetails() async -> Result<Business, Error>
}

protocol PlaceDetailsPresenterProtocol: AnyObject {
    func viewDidLoad()
    func getNumberOfViewModels() -> Int
    func getViewModel(atIndex index: Int) -> ItemViewModel
}
