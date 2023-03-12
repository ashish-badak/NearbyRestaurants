//
//  NearbyPlacesPresenter.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import Foundation

final class NearbyPlacesPresenter: NearbyPlacesPresenterProtocol {
    weak var view: NearbyPlacesViewProtocol?
    let interactor: NearbyPlacesInteractorProtocol
    let router: NearbyPlacesRouterProtocol
    
    init(
        interactor: NearbyPlacesInteractorProtocol,
        router: NearbyPlacesRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }
}
