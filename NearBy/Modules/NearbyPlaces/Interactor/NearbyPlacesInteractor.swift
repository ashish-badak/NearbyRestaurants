//
//  NearbyPlacesInteractor.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import Foundation

final class NearbyPlacesInteractor: NearbyPlacesInteractorProtocol {
    private var businesses: [Business] = []
    
    let placeType: String?
    let latitude: Double?
    let longitude: Double?
    private let service: NearbyPlacesAPIService
    
    init(
        placeType: String?,
        latitude: Double?,
        longitude: Double?,
        service: NearbyPlacesAPIService = NearbyPlacesAPIService()
    ) {
        self.placeType = placeType
        self.latitude = latitude
        self.longitude = longitude
        self.service = service
    }
    
    func fetchNearbyPlaces() async -> Result<[Business], Error> {
        let result = await service.fetchNearbyPlaces(
            placeType: placeType,
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
