//
//  WeatherService.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import Foundation

final class WeatherService: WeatherServiceProtocol {

  private let apiClient: ApiClientProtocol

  init(apiClient: ApiClientProtocol) {
    self.apiClient = apiClient
  }

  func fetchForecast(coordinate: Coordinate) async throws -> WeatherEntity {
    let response: ForecastResponse = try await apiClient.request(
      endpoint: ApiConstants.Endpoint.forecast,
      parameters: [
        ApiConstants.Params.query: coordinate.queryString,
        ApiConstants.Params.days: "3",
        ApiConstants.Params.aqi: "no",
        ApiConstants.Params.alerts: "no",
      ]
    )
    return WeatherMapper.map(response)
  }

  func searchLocations(query: String) async throws -> [SearchLocation] {
    let response: [SearchLocationResponse] = try await apiClient.request(
      endpoint: ApiConstants.Endpoint.search,
      parameters: [ApiConstants.Params.query: query]
    )
    return SearchLocationMapper.map(response)
  }
}
