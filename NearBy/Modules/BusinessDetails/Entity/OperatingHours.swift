//
//  OperatingHours.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

struct OperatingHours: Decodable {
    let isOvernight: Bool
    let start: String
    let end: String
    let day: Int
    
    enum CodingKeys: String, CodingKey {
        case start, end, day
        case isOvernight = "is_overnight"
    }
}
