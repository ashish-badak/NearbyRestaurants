//
//  ImageStore.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

final class ImageStore {
    private let downloader: ImageDownloader
    private let cache: ImageCache
    
    static let shared: ImageStore = ImageStore()
    
    init(
        downloader: ImageDownloader = DefaultImageDownloader.shared,
        cache: ImageCache = DefaultImageCache.shared
    ) {
        self.downloader = downloader
        self.cache = cache
    }
    
    public func fetchImage(for url: URL) async -> ImageResult {
        if let cachedImage = cache.image(forKey: url) {
            return .success((url, cachedImage))
        }
        
        let imageResult = await downloader.fetchImage(from: url)
        if case .success((let url, let image)) = imageResult {
            cache.set(image, forKey: url)
        }
        return imageResult
    }
}
