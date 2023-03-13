//
//  NearbyBusinessesInteractor.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import Foundation

final class NearbyBusinessesInteractor: NearbyBusinessesInteractorProtocol {
    private var businesses: [Business] = []
    
    let businessType: String?
    let latitude: Double?
    let longitude: Double?
    private let service: NearbyBusinessesAPIService
    
    init(
        businessType: String?,
        latitude: Double?,
        longitude: Double?,
        service: NearbyBusinessesAPIService = NearbyBusinessesAPIService()
    ) {
        self.businessType = businessType
        self.latitude = latitude
        self.longitude = longitude
        self.service = service
    }
    
    func fetchNearbyBusinesses() async -> Result<[Business], Error> {
        let result = await service.fetchNearbyBusinesses(
            businessType: businessType,
            latitude: latitude,
            longitude: longitude
        )
            
        switch result {
        case .success(let response):
            self.businesses = response.businesses
            return .success(businesses)
            
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func getBusiness(atIndex index: Int) -> Business {
        businesses[index]
    }
}
