//
//  Date+Formatting.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import Foundation

extension String {
    func toWeekdayAbbreviation() -> String {
        let input = DateFormatter()
        input.dateFormat = "yyyy-MM-dd"
        guard let date = input.date(from: self) else { return self }
        let output = DateFormatter()
        output.dateFormat = "EEE"
        return output.string(from: date)
    }
}
