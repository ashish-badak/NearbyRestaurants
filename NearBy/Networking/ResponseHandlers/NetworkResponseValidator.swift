//
//  NetworkResponseValidator.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

protocol NetworkResponseValidator {
    func validate(response: URLResponse?) -> Result<Bool, Error>
}

struct DefaultNetworkResponseValidator: NetworkResponseValidator {
    func validate(response: URLResponse?) -> Result<Bool, Error> {
        guard let httpResponse = response?.httpResponse else {
            return .failure(APIError.invalidResponse)
        }
        
        // - NOTE: More fine grained filtering can be done as per project requirements
        switch httpResponse.statusCode {
        case 200...299: return .success(true)
        case 400: return .failure(APIError.badRequest)
        case 401...403: return .failure(APIError.authFailure)
        default: return .failure(APIError.failed)
        }
    }
}
