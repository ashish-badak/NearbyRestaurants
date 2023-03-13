//
//  PlaceDetailInteractor.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

final class PlaceDetailInteractor: PlaceDetailsInteractorProtocol {
    let businessId: String
    private let service: PlaceDetailsAPIService
    
    init(
        businessId: String,
        service: PlaceDetailsAPIService = PlaceDetailsAPIService()
    ) {
        self.businessId = businessId
        self.service = service
    }
    
    func fetchPlaceDetails() async -> Result<Business, Error> {
        return await service.fetchPlaceDetails(businessId: businessId)
    }
}
