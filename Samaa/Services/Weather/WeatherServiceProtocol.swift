//
//  WeatherServiceProtocol.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import Foundation

protocol WeatherServiceProtocol {
    func fetchForecast(coordinate: Coordinate) async throws -> WeatherEntity
    func searchLocations(query: String) async throws -> [SearchLocation]
}
