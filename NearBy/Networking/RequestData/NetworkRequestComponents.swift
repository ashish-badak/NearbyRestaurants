//
//  NetworkRequestComponents.swift
//  NearBy
//
//  Created by Ashish Badak on 12/03/23.
//

import Foundation

typealias Parameters = [String: Any]

enum HTTPMethod: String {
    // - NOTE: Rest of the methods such as "POST", "DELETE", etc can be added as required
    //         Using "GET" as per assignment requirement
    
    case get = "GET"
}

enum URLScheme: String {
    case https
}

protocol NetworkRequestComponents {
    // - NOTE: We can add query parameters, http headers as well as other relevant parameters in actual project as per requirements. Keeping it confined to following properties as needed by current use case
    
    var httpMethod: HTTPMethod { get }
    var scheme: URLScheme { get }
    var host: String { get }
    var path: String { get }
    var parameters: Parameters { get }
    var additionalHeaders: HTTPHeaders? { get }
}

extension NetworkRequestComponents {
    var scheme: URLScheme { .https }
    var host: String { URL.NP.urlHost }
    var additionalHeaders: HTTPHeaders? { [:] }
}

extension NetworkRequestComponents {
    func mergingHeaders(into defaultHeaders: HTTPHeaders) -> HTTPHeaders {
        if let extraHeaders = additionalHeaders, !extraHeaders.isEmpty {
            /// request specific headers can be provided in additionalHeaders
            /// those shall overwrite default ones
            /// so merging by giving preference to extraHeaders (i.e. $1)
            return defaultHeaders.merging(extraHeaders) { $1 }
        }
        
        return defaultHeaders
    }
}

/// Use this protocol to construct network calls for `httpMethod` as `get`
protocol GetNetworkRequestComponents: NetworkRequestComponents { }
extension GetNetworkRequestComponents {
    var httpMethod: HTTPMethod { .get }
}
