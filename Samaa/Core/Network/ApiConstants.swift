//
//  ApiConstants.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import Foundation

enum ApiConstants {

  static let baseUrl = "https://api.weatherapi.com/v1"

  static let apiKey: String = {
    guard let key = Bundle.main.object(forInfoDictionaryKey: "WEATHER_API_KEY") as? String,
      !key.isEmpty
    else {
      fatalError("WEATHER_API_KEY missing from Info.plist")
    }
    return key
  }()

  enum Endpoint {
    static let forecast = "forecast.json"
    static let search = "search.json"
  }

  enum Params {
    static let key = "key"
    static let query = "q"
    static let days = "days"
    static let aqi = "aqi"
    static let alerts = "alerts"
  }
}
