//
//  JSONDecoderExtension.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

extension JSONDecoder {
    static var `default`: JSONDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }
}
