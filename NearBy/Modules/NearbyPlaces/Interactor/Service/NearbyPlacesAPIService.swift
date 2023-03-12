//
//  NearbyPlacesAPIService.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

struct NearbyPlacesAPIService {
    private let restClient: RestClient
    
    init(restClient: RestClient = .shared) {
        self.restClient = restClient
    }
    
    func fetchNearbyPlaces(
        placeType: String?,
        latitude: Double?,
        longitude: Double?
    ) async -> Result<NearbyPlaces, Error> {
        let requestComponents = NearbyPlacesNetworkRequestComponents(
            placeType: placeType,
            latitude: latitude,
            longitude: longitude
        )
        
        return await restClient.fetch(using: requestComponents)
    }
}
