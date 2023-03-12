//
//  RestClient.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

final class RestClient {
    private let requestBuilder: URLRequestConvertible
    private let requestPerformer: NetworkRequestPerformer
    
    static let shared: RestClient = RestClient()
    
    init(
        requestBuilder: URLRequestConvertible = DefaultNetworkRequestBuilder(),
        requestPerformer: NetworkRequestPerformer = DefaultNetworkRequestPerformer()
    ) {
        self.requestBuilder = requestBuilder
        self.requestPerformer = requestPerformer
    }
    
    func fetch<T: Decodable>(using components: NetworkRequestComponents) async -> Result<T, Error> {
        await fetchData(using: components).flatMap {
            JSONResponseMapper<T>().decode($0)
        }
    }
    
    func fetchData(using components: NetworkRequestComponents) async -> Result<Data, Error> {
        do {
            let urlRequest = try requestBuilder.buildURLRequest(using: components)
            return await requestPerformer.fetchData(from: urlRequest)
        } catch {
            return .failure(error)
        }
    }
}
