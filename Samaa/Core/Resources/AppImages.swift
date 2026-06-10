//
//  AppImages.swift
//  Samaa
//
//  Created by Abdelrahman on 04/06/2026.
//

import Foundation

struct AppImages {

    static let logo = "samaa_logo"

    static var backgroundImage: String {
        AppTheme.current == .day ? "day_background" : "night_background"
    }

    struct Icons {
        static let savedLocations = "list.bullet"
        static let search = "magnifyingglass"
        static let calendar = "calendar"
        static let cloud = "cloud"
        static let visibility = "eye"
        static let humidity = "humidity"
        static let feelsLike = "thermometer"
        static let pressure = "gauge"
        static let error = "exclamationmark.triangle"
        static let highTemp = "thermometer.sun"
        static let lowTemp = "thermometer.snowflake"
        static let back = "chevron.left"
        static let location = "location.fill"
        static let save = "bookmark"
        static let savedLocation = "bookmark.fill"

    }
}
