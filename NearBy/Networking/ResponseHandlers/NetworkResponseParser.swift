//
//  NetworkResponseParser.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

protocol NetworkResponseParser {
    func parse(data: Data?, response: URLResponse?) -> Result<Data, Error>
}

struct DefaultNetworkResponseParser: NetworkResponseParser {
    private let responseValidator: NetworkResponseValidator
    
    init(responseValidator: NetworkResponseValidator = DefaultNetworkResponseValidator()) {
        self.responseValidator = responseValidator
    }
    
    func parse(data: Data?, response: URLResponse?) -> Result<Data, Error> {
        return responseValidator.validate(response: response).flatMap { _ in
            if let data = data {
                return .success(data)
            } else {
                return .failure(APIError.noData)
            }
        }
    }
}
