//
//  BusinessDetailBannerViewModel.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

final class BusinessDetailBannerViewModel: ItemViewModel {
    let imageURL: URL?
    
    init(business: Business) {
        self.imageURL = business.imageURL
    }
}
