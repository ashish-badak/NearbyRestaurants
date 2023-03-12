//
//  NetworkRequestPerformer.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

protocol NetworkRequestPerformer {
    func fetchData(from url: URL) async -> Result<Data, Error>
    func fetchData(from request: URLRequest) async -> Result<Data, Error>
}

struct DefaultNetworkRequestPerformer: NetworkRequestPerformer {
    private let session: URLSession
    private let responseParser: NetworkResponseParser
    
    init(
        session: URLSession = .shared,
        responseParser: NetworkResponseParser = DefaultNetworkResponseParser()
    ) {
        self.session = session
        self.responseParser = responseParser
    }
    
    func fetchData(from url: URL) async -> Result<Data, Error> {
        await fetchData(from: URLRequest(url: url))
    }
    
    func fetchData(from request: URLRequest) async -> Result<Data, Error> {
        do {
            let (data, response) = try await session.data(for: request)
            return responseParser.parse(data: data, response: response)
        } catch {
            return .failure(error)
        }
    }
}
