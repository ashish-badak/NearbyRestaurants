//
//  NearbyBusinessesNetworkRequestComponents.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

struct NearbyBusinessesNetworkRequestComponents: GetNetworkRequestComponents {
    var path: String { "/v3/businesses/search" }
    var parameters: Parameters {
        let queryParamsProvider = NearbyBusinessesQueryParamsProvider(
            businessType: businessType,
            latitude: latitude,
            longitude: longitude
        )
        return queryParamsProvider.data?.dictionary ?? [:]
    }
    
    let businessType: String?
    let latitude: Double?
    let longitude: Double?
}
