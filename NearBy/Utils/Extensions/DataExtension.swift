//
//  DataExtension.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

extension Data {
    var dictionary: [String: Any]? {
        try? JSONSerialization.jsonObject(with: self) as? [String: Any]
    }
}
