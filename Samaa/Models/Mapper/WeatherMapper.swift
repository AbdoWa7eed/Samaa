//
//  WeatherMapper.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import Foundation

struct WeatherMapper {

  static func map(_ response: ForecastResponse) -> WeatherEntity {
    WeatherEntity(
      location: response.location.name,
      country: response.location.country ?? "",
      tempC: response.current.tempC ?? 0,
      feelsLikeC: response.current.feelslikeC ?? 0,
      humidity: response.current.humidity ?? 0,
      pressureMb: response.current.pressureMb ?? 0,
      visibilityKm: response.current.visKm ?? 0,
      conditionText: response.current.condition?.text ?? "",
      conditionIconUrl: iconUrl(response.current.condition?.icon),
      forecast: (response.forecast.forecastday ?? []).map(mapDay)
    )
  }

  private static func mapDay(_ day: ForecastDayResponse) -> ForecastDayEntity {
    ForecastDayEntity(
      date: day.date ?? "",
      maxTempC: day.day?.maxtempC ?? 0,
      minTempC: day.day?.mintempC ?? 0,
      conditionText: day.day?.condition?.text ?? "",
      conditionIconUrl: iconUrl(day.day?.condition?.icon),
      hours: (day.hour ?? []).map(mapHour)
    )
  }

  private static func mapHour(_ hour: HourResponse) -> HourEntity {
    HourEntity(
      time: hour.time ?? "",
      tempC: hour.tempC ?? 0,
      conditionText: hour.condition?.text ?? "",
      conditionIconUrl: iconUrl(hour.condition?.icon)
    )
  }

  private static func iconUrl(_ raw: String?) -> String {
    guard let raw = raw else { return "" }
    return raw.hasPrefix("//") ? "https:\(raw)" : raw
  }
}
