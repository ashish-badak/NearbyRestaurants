//
//  PlaceDetailsAPIService.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

struct PlaceDetailsAPIService {
    private let restClient: RestClient
    
    init(restClient: RestClient = .shared) {
        self.restClient = restClient
    }
    
    func fetchPlaceDetails(businessId: String) async -> Result<Business, Error> {
        let requestComponents = PlaceDetailsNetworkRequestComponents(businessId: businessId)
        return await restClient.fetch(using: requestComponents)
    }
}
