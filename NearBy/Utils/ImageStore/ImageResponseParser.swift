//
//  ImageResponseParser.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

struct ImageResponseParser: NetworkResponseParser {
    func parse(
        data: Data?,
        response: URLResponse?
    ) -> Result<Data, Error> {
        if let data = data {
            return .success(data)
        } else {
            return .failure(ImageError.noData)
        }
    }
}
