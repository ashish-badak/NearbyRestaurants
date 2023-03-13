//
//  Business.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

struct NearbyPlaces: Decodable {
    let businesses: [Business]
}

struct Business: Decodable {
    let id: String
    let name: String
    let imageURL: URL
    let rating: Double
    let reviewCount: Int
    let price: String?
    let phone: String
    let displayPhone: String
    let isClosed: Bool
    let weeklySchedule: [WeeklySchedule]?

    enum CodingKeys: String, CodingKey {
        case id, name, rating, price, phone
        case imageURL = "image_url"
        case reviewCount = "review_count"
        case displayPhone = "display_phone"
        case isClosed = "is_closed"
        case weeklySchedule = "hours"
    }
}
