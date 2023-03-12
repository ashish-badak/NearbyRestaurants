//
//  URLExtension.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import Foundation

extension URL {
    enum NP {
        static var urlHost: String { "api.yelp.com" }
    }
}

extension URLResponse {
    var httpResponse: HTTPURLResponse? { self as? HTTPURLResponse }
}
