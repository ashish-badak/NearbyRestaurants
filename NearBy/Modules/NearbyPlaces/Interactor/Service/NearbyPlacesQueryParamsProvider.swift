//
//  NearbyPlacesQueryParamsProvider.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

final class PRListAPIRequestQueryParams: Encodable {
    let placeType: String?
    let latitude: Double?
    let longitude: Double?
    
    init(placeType: String?, latitude: Double?, longitude: Double?) {
        self.placeType = placeType
        self.latitude = latitude
        self.longitude = longitude
    }
    
    enum CodingKeys: String, CodingKey {
        case placeType = "term"
        case latitude
        case longitude
    }
}
