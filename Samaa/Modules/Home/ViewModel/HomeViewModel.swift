//
//  HomeViewModel.swift
//  Samaa
//
//  Created by Abdelrahman on 10/06/2026.
//

import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {

    @Published private(set) var pages: [WeatherPage] = []
    @Published private(set) var isLoading = false
    @Published private(set) var errorMessage: String?

    private let weatherService: WeatherServiceProtocol
    private let savedLocationsService: SavedLocationsServiceProtocol
    private let locationManager: LocationManager
    private var cancellables = Set<AnyCancellable>()

    private var currentLocationPage: WeatherPage?
    private var savedPages: [WeatherPage] = []

    init(
        weatherService: WeatherServiceProtocol,
        savedLocationsService: SavedLocationsServiceProtocol,
        locationManager: LocationManager
    ) {
        self.weatherService = weatherService
        self.savedLocationsService = savedLocationsService
        self.locationManager = locationManager
        setupBindings()
    }

    func onAppear() {
        guard pages.isEmpty, !isLoading else { return }
        loadAll()
    }

    func retry() {
        errorMessage = nil
        pages = []
        currentLocationPage = nil
        savedPages = []
        loadAll()
    }

    func toggleSave(for weather: WeatherEntity) {
        if savedLocationsService.isSaved(id: weather.id) {
            savedLocationsService.delete(withId: weather.id)
        } else {
            savedLocationsService.save(weather.toSearchLocation())
        }
    }

    private func setupBindings() {
        savedLocationsService.fetchAll()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] locations in
                guard let self = self else { return }
                Task {
                    await self.handleSavedLocationsChanged(locations)
                }
            }
            .store(in: &cancellables)
    }

    private func loadAll() {
        isLoading = true
        locationManager.onLocationUpdate = { [weak self] coordinate in
            guard let self = self else { return }
            Task { await self.handleLocationReceived(coordinate: coordinate) }
        }
        locationManager.onError = { [weak self] message in
            guard let self = self else { return }
            Task { await self.handleLocationFailed(message: message) }
        }
        locationManager.requestLocation()
    }

    private func handleLocationReceived(coordinate: Coordinate) async {
        do {
            let current = try await weatherService.fetchForecast(coordinate: coordinate)
            currentLocationPage = .currentLocation(current)
            combinePages()
        } catch {
            await handleLocationFailed(message: error.localizedDescription)
        }
        isLoading = false
    }

    private func handleLocationFailed(message: String) async {
        if savedPages.isEmpty {
            errorMessage = message
        }
        isLoading = false
    }

    private func handleSavedLocationsChanged(_ locations: [SearchLocation]) async {
        var updatedPages: [WeatherPage] = []
        for location in locations {
            if let weather = try? await weatherService.fetchForecast(coordinate: location.coordinate) {
                updatedPages.append(.saved(weather))
            }
        }
        savedPages = updatedPages
        combinePages()
    }

    private func combinePages() {
        var allPages: [WeatherPage] = []
        if let current = currentLocationPage {
            allPages.append(current)
        }
        allPages.append(contentsOf: savedPages)
        pages = allPages
    }
}
