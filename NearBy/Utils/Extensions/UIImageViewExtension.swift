//
//  UIImageViewExtension.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import UIKit

extension UIImageView {
    func downloadImage(
        from url: URL?,
        placeholderImageName: String = "placeholder"
    ) async -> (URL?, UIImage?) {
        var contentImage: UIImage?
        
        if !placeholderImageName.isEmpty {
            let placeholderImage = UIImage(named: placeholderImageName)
            contentImage = placeholderImage
            image = placeholderImage
        }
        
        guard let imageURL = url else {
            return (url, contentImage)
        }
        
        let result = await ImageStore.shared.fetchImage(for: imageURL)
        
        switch result {
        case .success((let receivedURL, let image)):
            return (receivedURL, image)
            
        case .failure:
            return (imageURL, contentImage)
        }
    }
}
