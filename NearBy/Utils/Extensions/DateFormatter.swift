//
//  DateFormatter.swift
//  NearBy
//
//  Created by Ashish Badak on 13/03/23.
//

import Foundation

extension DateFormatter {
    static func convertToAMPM(time: String, dateFormat: String = "HHmm") -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = dateFormat
        guard let date = dateFormatter.date(from: time) else {
            return nil
        }
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: date)
    }
}
