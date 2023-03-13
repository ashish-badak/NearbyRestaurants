//
//  NearbyBusinessesPresenter.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import Foundation

final class NearbyBusinessesPresenter {
    weak var view: NearbyBusinessesViewProtocol?
    let interactor: NearbyBusinessesInteractorProtocol
    let router: NearbyBusinessesRouterProtocol
    
    private var viewModels: [NearbyPlaceViewModel] = []

    init(
        interactor: NearbyBusinessesInteractorProtocol,
        router: NearbyBusinessesRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    private func fetchNearbyBusinesses() {
        Task {
            view?.showLoading()
            let result = await interactor.fetchNearbyBusinesses()
            view?.hideLoading()
            
            switch result {
            case .success(let businesses):
                viewModels = businesses.map {
                    NearbyPlaceViewModel(business: $0)
                }
                view?.showNearbyBusinesses()
                
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

extension NearbyBusinessesPresenter: NearbyBusinessesPresenterProtocol {
    func viewDidLoad() {
        fetchNearbyBusinesses()
    }
    
    func placeDidTap(at index: Int) {
        let business = interactor.getBusiness(atIndex: index)
        router.routeToPlaceDetailsScreen(
            businessId: business.id,
            businessName: business.name
        )
    }
    
    func getNumberOfViewModels() -> Int {
        return viewModels.count
    }
    
    func getViewModel(atIndex index: Int) -> NearbyPlaceViewModel {
        return viewModels[index]
    }
}
