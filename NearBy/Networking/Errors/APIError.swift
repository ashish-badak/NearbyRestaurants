//
//  APIError.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case encodingFailure
    case badRequest
    case authFailure
    case failed
    case invalidResponse
    case noData
    case decodingFailure
}

extension APIError: CustomStringConvertible {
    var description: String {
        switch self {
        case .invalidURL:
            return "URL is not present or invalid"
        case .encodingFailure:
            return "URL parameter encoding failed"
        case .badRequest:
            return "UhOh! Bad Request."
        case .authFailure:
            return "Authorisation Failure."
        case .failed:
            return "Network request failed."
        case .invalidResponse:
            return "Failed to parse response"
        case .noData:
            return "Did not receive Data"
        case .decodingFailure:
            return "Failed to decode response"
        }
    }
}
