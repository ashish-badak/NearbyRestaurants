//
//  ImageDownloader.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation
import UIKit

enum ImageError: Error {
    case noData
    case corruptImage
    case fetchingFailure
}

typealias ImageResult = Result<(URL, UIImage), ImageError>
typealias ImageResultCallback = (ImageResult) -> Void

protocol ImageDownloader {
    func fetchImage(from url: URL) async -> ImageResult
}

final class DefaultImageDownloader: ImageDownloader {
    private let requestPerformer: NetworkRequestPerformer
    static let shared = DefaultImageDownloader()
    
    private init() {
        requestPerformer = DefaultNetworkRequestPerformer(
            responseParser: ImageResponseParser()
        )
    }
    
    func fetchImage(from url: URL) async -> ImageResult {
        let result = await requestPerformer.fetchData(from: url).flatMapError { error in
            let imageError: ImageError = error as? ImageError ?? .fetchingFailure
            return .failure(imageError)
        }
        
        return result.flatMap { data in
            if let image = UIImage(data: data) {
                return .success((url, image))
            } else {
                return .failure(ImageError.noData)
            }
        }
    }
}
