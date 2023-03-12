//
//  HTTPHeaderProvider.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import Foundation

typealias HTTPHeaders = [String: String]
protocol HTTPHeaderProvider {
    func getHeaders() -> HTTPHeaders
}

struct DefaultHeaderProvider: HTTPHeaderProvider {
    func getHeaders() -> HTTPHeaders {
        [
            HTTPHeader.authorization.key: HTTPHeader.authorization.value,
            HTTPHeader.contentType.key: HTTPHeader.contentType.value
        ]
    }
}
