//
//  NearbyPlacesNetworkRequestComponents.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation


struct NearbyPlacesNetworkRequestComponents: GetNetworkRequestComponents {
    var path: String { "v3/businesses/search" }
    var parameters: Parameters {
        let queryParamsProvider = PRListAPIRequestQueryParams(
            placeType: placeType,
            latitude: latitude,
            longitude: longitude
        )
        return queryParamsProvider.data?.dictionary ?? [:]
    }
    
    let placeType: String?
    let latitude: Double?
    let longitude: Double?
}
