//
//  PlaceDetailsNetworkRequestComponents.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

struct PlaceDetailsNetworkRequestComponents: GetNetworkRequestComponents {
    var path: String { "/v3/businesses/\(businessId)" }
    var parameters: Parameters { [:] }
    let businessId: String
}
