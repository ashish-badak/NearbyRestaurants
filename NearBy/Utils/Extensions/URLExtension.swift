//
//  URLExtension.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import Foundation

extension URL {
    enum NP {
        static var baseURL: URL { URL(string: "https://api.yelp.com/v3")! }
    }
}
