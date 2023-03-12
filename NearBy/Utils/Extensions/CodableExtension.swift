//
//  CodableExtension.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

extension Encodable {
    var data: Data? { try? JSONEncoder().encode(self) }
}
