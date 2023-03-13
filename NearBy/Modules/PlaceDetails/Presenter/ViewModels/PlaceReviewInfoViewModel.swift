//
//  PlaceReviewInfoViewModel.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

final class PlaceReviewInfoViewModel: PlaceDetailsInfoViewModel {
    var title: String { "Reviews:" }
    var info: String { reviewCount }
    
    private let reviewCount: String
    
    init(business: Business) {
        self.reviewCount = "\(business.reviewCount)"
    }
}
