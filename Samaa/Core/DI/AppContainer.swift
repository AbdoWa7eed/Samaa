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
    }

    private let apiClient: ApiClientProtocol

    private lazy var weatherService: WeatherServiceProtocol = {
        WeatherService(apiClient: self.apiClient)
    }()
    
    private lazy var locationManager: LocationManager = {
        LocationManager()
    }()

    func makeWeatherViewModel() -> WeatherViewModel {
        WeatherViewModel(
            weatherService: weatherService,
            locationManager: locationManager
        )
    }
}
