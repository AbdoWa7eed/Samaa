//
//  WeatherViewModel.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import Foundation
import CoreLocation

final class WeatherViewModel: ObservableObject {

    @Published private(set) var weather: WeatherEntity?
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?

    private let weatherService: WeatherServiceProtocol
    private let locationManager: LocationManager

    init(
        weatherService: WeatherServiceProtocol,
        locationManager: LocationManager
    ) {
        self.weatherService = weatherService
        self.locationManager = locationManager
    }

    func onAppear() {
        locationManager.onLocationUpdate = { [weak self] coordinate in
            self?.fetchWeather(for: coordinate)
        }
        locationManager.onError = { [weak self] message in
            self?.errorMessage = message
            self?.isLoading = false
        }
        isLoading = true
        locationManager.requestLocation()
    }

    func retry() {
        errorMessage = nil
        onAppear()
    }

    private func fetchWeather(for coordinate: Coordinate) {
        Task { @MainActor in
            do {
                weather = try await weatherService.fetchForecast(coordinate: coordinate)
                isLoading = false
            } catch {
                errorMessage = error.localizedDescription
                isLoading = false
            }
        }
    }
}
