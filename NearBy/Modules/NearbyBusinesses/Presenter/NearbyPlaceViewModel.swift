//
//  NearbyPlaceViewModel.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

final class NearbyPlaceViewModel {
    let name: String
    let imageURL: URL
    let rating: String
    let price: String?
    
    init(business: Business) {
        name = business.name
        imageURL = business.imageURL
        rating = "\(business.rating) ⭐️"
        price = business.price
    }
}
