//
//  BusinessDetailInteractor.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

final class BusinessDetailInteractor: BusinessDetailsInteractorProtocol {
    let businessId: String
    private let service: BusinessDetailsAPIService
    
    init(
        businessId: String,
        service: BusinessDetailsAPIService = BusinessDetailsAPIService()
    ) {
        self.businessId = businessId
        self.service = service
    }
    
    func fetchBusinessDetails() async -> Result<Business, Error> {
        return await service.fetchBusinessDetails(businessId: businessId)
    }
}
