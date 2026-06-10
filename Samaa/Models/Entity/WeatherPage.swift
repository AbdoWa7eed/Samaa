//
//  WeatherPage.swift
//  Samaa
//
//  Created by Abdelrahman on 10/06/2026.
//

import Foundation

enum WeatherPage: Identifiable {
    case currentLocation(WeatherEntity)
    case saved(WeatherEntity)

    var id: Int {
        switch self {
        case .currentLocation(let w): return w.id
        case .saved(let w): return w.id
        }
    }

    var weather: WeatherEntity {
        switch self {
        case .currentLocation(let w), .saved(let w): return w
        }
    }

    var isCurrentLocation: Bool {
        if case .currentLocation = self { return true }
        return false
    }

    var isSaved: Bool {
        if case .saved = self { return true }
        return false
    }
}
