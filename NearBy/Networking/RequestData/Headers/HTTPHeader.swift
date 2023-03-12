//
//  HTTPHeader.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import Foundation

struct HTTPHeader {
    var key: String
    var value: String
}

extension HTTPHeader {
    static var authorization: Self {
        .init(key: "Authorization", value: "Bearer \(Constants.apiKey)")
    }
    
    static var contentType: Self {
        .init(key: "accept", value: Constants.contentType)
    }
}
