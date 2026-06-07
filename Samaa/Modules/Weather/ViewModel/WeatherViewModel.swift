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
    @Published private(set) var isSaved = false

    private let weatherService: WeatherServiceProtocol
    private let savedLocationsService: SavedLocationsServiceProtocol?
    private let locationManager: LocationManager?
    private let mode: WeatherViewMode

    init(
        mode: WeatherViewMode,
        weatherService: WeatherServiceProtocol,
        savedLocationsService: SavedLocationsServiceProtocol?,
        locationManager: LocationManager?
    ) {
        self.mode = mode
        self.weatherService = weatherService
        self.savedLocationsService = savedLocationsService
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

    func saveCurrentLocation() {
        guard let weather = weather,
              let service = savedLocationsService else { return }
        if isSaved {
            service.delete(withId: weather.id)
            isSaved = false
        } else {
            service.save(weather.toSearchLocation())
            isSaved = true
        }
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
                checkIfSaved()
                isLoading = false
            } catch {
                errorMessage = error.localizedDescription
                isLoading = false
            }
        }
    }

    private func checkIfSaved() {
        guard let weather = weather,
              let service = savedLocationsService else { return }
        isSaved = service.isSaved(id: weather.id)
    }
}
