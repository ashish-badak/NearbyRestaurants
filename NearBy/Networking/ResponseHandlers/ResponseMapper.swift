//
//  ResponseMapper.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

/// Conform to this protocol to create your own implementation of data mapper.
/// Provide `Input` type that your mapper expects as input and define `Output` as expected resultant type that your mapper will map `Intput` type to.
protocol ResponseMapper {
    associatedtype Input
    associatedtype Output

    func decode(_ data: Input) -> Result<Output, Error>
}

struct JSONResponseMapper<Output: Decodable>: ResponseMapper {
    typealias Input = Data
    private let decoder: JSONDecoder
    
    init(decoder: JSONDecoder = JSONDecoder()) {
        self.decoder = decoder
    }
    
    func decode(_ data: Input) -> Result<Output, Error> {
        do {
            let mappedData = try decoder.decode(Output.self, from: data)
            return .success(mappedData)
        } catch {
            return .failure(APIError.decodingFailure)
        }
    }
}
