//
//  LocationManager.swift
//  Samaa
//
//  Created by Abdelrahman on 06/06/2026.
//

import Foundation

import Foundation
import CoreLocation

final class LocationManager: NSObject, CLLocationManagerDelegate {

    var onLocationUpdate: ((Coordinate) -> Void)?
    var onError: ((String) -> Void)?

    private let manager = CLLocationManager()
    private var didFetch = false

    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyKilometer
    }

    func requestLocation() {
        didFetch = false
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            manager.requestLocation()
        case .denied, .restricted:
            onError?("Location access denied. Enable it in Settings.")
        @unknown default:
            onError?("Location unavailable.")
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !didFetch, let location = locations.first else { return }
        didFetch = true
        let coordinate = Coordinate(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
        onLocationUpdate?(coordinate)
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        onError?("Could not fetch your location.")
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse ||
           manager.authorizationStatus == .authorizedAlways {
            manager.requestLocation()
        }
    }
}
