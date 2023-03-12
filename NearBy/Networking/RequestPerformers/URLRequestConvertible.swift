//
//  URLRequestConvertible.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

protocol URLRequestConvertible {
    func buildURLRequest(using components: NetworkRequestComponents) throws -> URLRequest
}

struct DefaultNetworkRequestBuilder: URLRequestConvertible, URLConvertible {
    private let cachePolicy: URLRequest.CachePolicy
    private let timeoutInterval: TimeInterval
    
    init(
        cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
        timeoutInterval: TimeInterval = 10.0
    ) {
        self.cachePolicy = cachePolicy
        self.timeoutInterval = timeoutInterval
    }
    
    func buildURLRequest(using components: NetworkRequestComponents) throws -> URLRequest {
        let url = try buildURL(using: components)
        var request = URLRequest(
            url: url,
            cachePolicy: cachePolicy,
            timeoutInterval: timeoutInterval
        )
        
        request.httpMethod = components.httpMethod.rawValue
        request.allHTTPHeaderFields = components.mergingHeaders(
            into: DefaultHeaderProvider().getHeaders()
        )
        
        return request
    }
}
