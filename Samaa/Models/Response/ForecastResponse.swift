//
//  ForecastResponse.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import Foundation

struct ForecastResponse: Decodable {
  let location: LocationResponse
  let current: CurrentResponse
  let forecast: ForecastWrapper
}

struct LocationResponse: Decodable {
  let name: String
  let country: String?
  let region: String?   
  let lat: Double
  let lon: Double
}

struct CurrentResponse: Decodable {
  let tempC: Double?
  let feelslikeC: Double?
  let humidity: Int?
  let pressureMb: Double?
  let visKm: Double?
  let condition: ConditionResponse?

  enum CodingKeys: String, CodingKey {
    case tempC = "temp_c"
    case feelslikeC = "feelslike_c"
    case humidity
    case pressureMb = "pressure_mb"
    case visKm = "vis_km"
    case condition
  }
}

struct ConditionResponse: Decodable {
  let text: String?
  let icon: String?
}

struct ForecastWrapper: Decodable {
  let forecastday: [ForecastDayResponse]?
}

struct ForecastDayResponse: Decodable {
  let date: String?
  let day: DayResponse?
  let hour: [HourResponse]?
}

struct DayResponse: Decodable {
  let maxtempC: Double?
  let mintempC: Double?
  let condition: ConditionResponse?

  enum CodingKeys: String, CodingKey {
    case maxtempC = "maxtemp_c"
    case mintempC = "mintemp_c"
    case condition
  }
}

struct HourResponse: Decodable {
  let time: String?
  let tempC: Double?
  let condition: ConditionResponse?

  enum CodingKeys: String, CodingKey {
    case time
    case tempC = "temp_c"
    case condition
  }
}
