//
//  WeatherEntity.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import Foundation

struct WeatherEntity {
    let id: Int
    let cityName: String
    let region: String
    let country: String
    let coordinate: Coordinate  
    let tempC: Double
    let feelsLikeC: Double
    let humidity: Int
    let pressureMb: Double
    let visibilityKm: Double
    let conditionText: String
    let conditionIconUrl: String
    let forecast: [ForecastDayEntity]
}

struct ForecastDayEntity {
    let date: String
    let maxTempC: Double
    let minTempC: Double
    let conditionText: String
    let conditionIconUrl: String
    let hours: [HourEntity]
}

struct HourEntity {
    let time: String
    let tempC: Double
    let conditionText: String
    let conditionIconUrl: String
}

extension WeatherEntity {
    func toSearchLocation() -> SearchLocation {
        SearchLocation(
            id: id,
            name: cityName,
            country: country,
            region: region,
            coordinate: coordinate
        )
    }
}
