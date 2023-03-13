//
//  BusinessDetailsModuleProtocols.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

protocol BusinessDetailsViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    func showError(message: String)
    func showBusinessDetails()
}

protocol BusinessDetailsInteractorProtocol: AnyObject {
    func fetchBusinessDetails() async -> Result<Business, Error>
}

protocol BusinessDetailsPresenterProtocol: AnyObject {
    func viewDidLoad()
    func getNumberOfViewModels() -> Int
    func getViewModel(atIndex index: Int) -> ItemViewModel
}
