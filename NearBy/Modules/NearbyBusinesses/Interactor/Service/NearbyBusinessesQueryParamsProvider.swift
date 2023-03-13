//
//  NearbyBusinessesQueryParamsProvider.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

final class NearbyBusinessesQueryParamsProvider: Encodable {
    let businessType: String?
    let latitude: Double?
    let longitude: Double?
    
    init(businessType: String?, latitude: Double?, longitude: Double?) {
        self.businessType = businessType
        self.latitude = latitude
        self.longitude = longitude
    }
    
    enum CodingKeys: String, CodingKey {
        case businessType = "term"
        case latitude
        case longitude
    }
}
