//
//  NearbyPlacesPresenter.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import Foundation

final class NearbyPlacesPresenter {
    weak var view: NearbyPlacesViewProtocol?
    let interactor: NearbyPlacesInteractorProtocol
    let router: NearbyPlacesRouterProtocol
    
    private var viewModels: [NearbyPlaceViewModel] = []

    init(
        interactor: NearbyPlacesInteractorProtocol,
        router: NearbyPlacesRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    private func fetchNearbyPlaces() {
        Task {
            view?.showLoading()
            let result = await interactor.fetchNearbyPlaces()
            view?.hideLoading()
            
            switch result {
            case .success(let businesses):
                viewModels = businesses.map {
                    NearbyPlaceViewModel(business: $0)
                }
                view?.showNearbyPlaces()
                
            case .failure(let error):
                var errorMessage: String
                if let error = error as? APIError {
                    errorMessage = error.description
                } else {
                    errorMessage = error.localizedDescription
                }
                view?.showError(message: errorMessage)
            }
        }
    }
}

extension NearbyPlacesPresenter: NearbyPlacesPresenterProtocol {
    func viewDidLoad() {
        fetchNearbyPlaces()
    }
    
    func placeDidTap(at index: Int) {
        // - TODO: Use router to open details page
    }
    
    func getNumberOfViewModels() -> Int {
        return viewModels.count
    }
    
    func getViewModel(atIndex index: Int) -> NearbyPlaceViewModel {
        return viewModels[index]
    }
}
