//
//  BusinessContactInfoViewModel.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

final class BusinessContactInfoViewModel: BusinessDetailsInfoViewModel {
    var title: String { "Contact:" }
    var info: String { phone }
    
    private let phone: String
    
    init(business: Business) {
        self.phone = business.displayPhone
    }
}
