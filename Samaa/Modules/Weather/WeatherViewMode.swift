//
//  WeatherViewMode.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import Foundation

enum WeatherViewMode {
    case currentLocation
    case selectedLocation(Coordinate)

    var isDetail: Bool {
        switch self {
        case .currentLocation: return false
        case .selectedLocation: return true
        }
    }
}
