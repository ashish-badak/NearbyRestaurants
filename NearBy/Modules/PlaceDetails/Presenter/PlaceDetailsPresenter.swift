//
//  PlaceDetailsPresenter.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

final class PlaceDetailsPresenter {
    weak var view: PlaceDetailsViewProtocol?
    let interactor: PlaceDetailsInteractorProtocol
    
    private var viewModels: [ItemViewModel] = []
    
    init(
        view: PlaceDetailsViewProtocol? = nil,
        interactor: PlaceDetailsInteractorProtocol
    ) {
        self.view = view
        self.interactor = interactor
    }
    
    private func fetchPlaceDetails() {
        Task {
            view?.showLoading()
            let result = await interactor.fetchPlaceDetails()
            view?.hideLoading()
            
            switch result {
            case .success(let business):
                buildViewModels(using: business)
                view?.showPlaceDetails()
                
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
    
    private func buildViewModels(using business: Business) {
        viewModels = [
            PlaceDetailBannerViewModel(business: business),
            PlaceContactInfoViewModel(business: business),
            PlaceReviewInfoViewModel(business: business),
            PlaceOperatingHoursViewModel(business: business)
        ]
    }
}

extension PlaceDetailsPresenter: PlaceDetailsPresenterProtocol {
    func viewDidLoad() {
        fetchPlaceDetails()
    }
    
    func getNumberOfViewModels() -> Int {
        viewModels.count
    }
    
    func getViewModel(atIndex index: Int) -> ItemViewModel {
        viewModels[index]
    }
}
