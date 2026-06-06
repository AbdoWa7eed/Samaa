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
    
    func toHourLabel() -> String {
            let input = DateFormatter()
            input.dateFormat = "yyyy-MM-dd HH:mm"
            guard let date = input.date(from: self) else { return self }
            let output = DateFormatter()
            output.dateFormat = "h a"
            return output.string(from: date)
        }
    
    func toDayTitle() -> String {
        let input = DateFormatter()
        input.dateFormat = "yyyy-MM-dd"
        guard let date = input.date(from: self) else { return self }
        let output = DateFormatter()
        output.dateFormat = "EEE, MMM d"
        return output.string(from: date)
    }
    
    func isToday() -> Bool {
            let input = DateFormatter()
            input.dateFormat = "yyyy-MM-dd"
            let todayString = input.string(from: Date())
            return self == todayString
    }
}

extension Array where Element == HourEntity {

    func fromCurrentHourEvery2(isToday: Bool) -> [HourEntity] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"

        let allEvery2 = every2Hours()

        guard isToday else {
            return allEvery2
        }

        let currentHour = Calendar.current.component(.hour, from: Date())

        let nowIndex = allEvery2.lastIndex(where: {
            guard let date = formatter.date(from: $0.time) else { return false }
            return Calendar.current.component(.hour, from: date) <= currentHour
        }) ?? 0

        return Array(allEvery2.suffix(from: nowIndex))
    }

    private func every2Hours() -> [HourEntity] {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"

        return self.compactMap { hour in
            guard let date = formatter.date(from: hour.time) else { return nil }
            return Calendar.current.component(.hour, from: date) % 2 == 0 ? hour : nil
        }
    }
}
