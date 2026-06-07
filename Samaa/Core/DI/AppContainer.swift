//
//  AppContainer.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import Foundation


final class AppContainer {

    static let shared = AppContainer()

    private init() {
        self.apiClient = ApiClient()
        self.persistenceController = PersistenceController()
    }

    private let apiClient: ApiClientProtocol
    private let persistenceController: PersistenceController

    private lazy var weatherService: WeatherServiceProtocol = {
        WeatherService(apiClient: self.apiClient)
    }()
    
    private lazy var savedLocationsService: SavedLocationsServiceProtocol = {
        SavedLocationsService(persistenceController: persistenceController)
    }()
    
    private lazy var locationManager: LocationManager = {
        LocationManager()
    }()

    
    func makeWeatherViewModel(mode: WeatherViewMode) -> WeatherViewModel {
        WeatherViewModel(
            mode: mode,
            weatherService: weatherService,
            locationManager: mode.isDetail ? nil : locationManager
        )
    }
    
    func makeSearchViewModel() -> SearchViewModel {
        SearchViewModel(
            weatherService: weatherService
        )
    }
}
