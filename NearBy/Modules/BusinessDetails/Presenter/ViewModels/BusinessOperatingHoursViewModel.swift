//
//  BusinessOperatingHoursViewModel.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

final class BusinessOperatingHoursViewModel: BusinessDetailsInfoViewModel {
    var title: String { "Operating Hours" }
    var info: String { operatingHours }
    
    private let operatingHours: String
    
    init(business: Business) {
        let operatingHours = business.weeklySchedule?
            .first?
            .operatingHours
            .first { $0.day == 0 }
        
        if let startTime = operatingHours?.start,
           let endTime = operatingHours?.end,
           let startTimeInAMPM = DateFormatter.convertToAMPM(time: startTime),
           let endTimeInAMPM = DateFormatter.convertToAMPM(time: endTime)
        {
            self.operatingHours = "\(startTimeInAMPM) - \(endTimeInAMPM)"
        } else if business.isClosed {
            self.operatingHours = "Closed"
        } else {
            self.operatingHours = "Open"
        }
    }
}
