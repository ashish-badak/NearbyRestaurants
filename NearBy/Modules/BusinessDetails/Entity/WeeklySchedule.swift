//
//  WeeklySchedule.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

struct WeeklySchedule: Decodable {
    let operatingHours: [OperatingHours]
    let hoursType: String
    let isOpenNow: Bool
    
    private enum CodingKeys: String, CodingKey {
        case operatingHours = "open"
        case hoursType = "hours_type"
        case isOpenNow = "is_open_now"
    }
}
