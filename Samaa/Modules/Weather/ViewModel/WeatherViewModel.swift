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
    private let locationManager: LocationManager?
    private let mode: WeatherViewMode

    init(mode: WeatherViewMode, weatherService: WeatherServiceProtocol, locationManager: LocationManager?) {
        self.mode = mode
        self.weatherService = weatherService
        self.locationManager = locationManager
    }

    func onAppear() {
        guard weather == nil else { return }
        switch mode {
        case .currentLocation:
            requestDeviceLocation()
        case .selectedLocation(let coordinate):
            fetchWeather(for: coordinate)
        }
    }

    func retry() {
        errorMessage = nil
        onAppear()
    }

    private func requestDeviceLocation() {
        isLoading = true
        locationManager?.onLocationUpdate = { [weak self] coordinate in
            self?.fetchWeather(for: coordinate)
        }
        locationManager?.onError = { [weak self] message in
            self?.errorMessage = message
            self?.isLoading = false
        }
        locationManager?.requestLocation()
    }

    private func fetchWeather(for coordinate: Coordinate) {
        isLoading = true
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
