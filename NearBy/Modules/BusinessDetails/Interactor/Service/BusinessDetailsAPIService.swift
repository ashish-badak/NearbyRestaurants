//
//  BusinessDetailsAPIService.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

struct BusinessDetailsAPIService {
    private let restClient: RestClient
    
    init(restClient: RestClient = .shared) {
        self.restClient = restClient
    }
    
    func fetchBusinessDetails(businessId: String) async -> Result<Business, Error> {
        let requestComponents = BusinessDetailsNetworkRequestComponents(businessId: businessId)
        return await restClient.fetch(using: requestComponents)
    }
}
