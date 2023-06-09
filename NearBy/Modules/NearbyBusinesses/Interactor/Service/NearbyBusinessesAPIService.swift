//
//  NearbyBusinessesAPIService.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

struct NearbyBusinessesAPIService {
    private let restClient: RestClient
    
    init(restClient: RestClient = .shared) {
        self.restClient = restClient
    }
    
    func fetchNearbyBusinesses(
        businessType: String?,
        latitude: Double?,
        longitude: Double?
    ) async -> Result<NearbyBusinesses, Error> {
        let requestComponents = NearbyBusinessesNetworkRequestComponents(
            businessType: businessType,
            latitude: latitude,
            longitude: longitude
        )
        
        return await restClient.fetch(using: requestComponents)
    }
}
