//
//  BusinessDetailsPresenter.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

final class BusinessDetailsPresenter {
    weak var view: BusinessDetailsViewProtocol?
    let interactor: BusinessDetailsInteractorProtocol
    
    private var viewModels: [ItemViewModel] = []
    
    init(
        view: BusinessDetailsViewProtocol? = nil,
        interactor: BusinessDetailsInteractorProtocol
    ) {
        self.view = view
        self.interactor = interactor
    }
    
    private func fetchBusinessDetails() {
        Task {
            view?.showLoading()
            let result = await interactor.fetchBusinessDetails()
            view?.hideLoading()
            
            switch result {
            case .success(let business):
                buildViewModels(using: business)
                view?.showBusinessDetails()
                
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
            BusinessDetailBannerViewModel(business: business),
            BusinessContactInfoViewModel(business: business),
            BusinessReviewInfoViewModel(business: business),
            BusinessOperatingHoursViewModel(business: business)
        ]
    }
}

extension BusinessDetailsPresenter: BusinessDetailsPresenterProtocol {
    func viewDidLoad() {
        fetchBusinessDetails()
    }
    
    func getNumberOfViewModels() -> Int {
        viewModels.count
    }
    
    func getViewModel(atIndex index: Int) -> ItemViewModel {
        viewModels[index]
    }
}
