//
//  URLConvertible.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

protocol URLConvertible {
    func buildURL(using components: NetworkRequestComponents) throws -> URL
}

extension URLConvertible {
    func buildURL(using components: NetworkRequestComponents) throws -> URL {
        var urlComponents = URLComponents()
        urlComponents.scheme = components.scheme.rawValue
        urlComponents.host = components.host
        urlComponents.path = components.path
        urlComponents.queryItems = components.parameters.map {
            URLQueryItem(name: $0.key, value: "\($0.value)")
        }
        
        if let url = urlComponents.url {
            return url
        } else {
            throw APIError.invalidURL
        }
    }
}
