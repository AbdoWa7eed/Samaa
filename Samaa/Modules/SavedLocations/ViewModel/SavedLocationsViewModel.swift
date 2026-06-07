//
//  SavedLocationsViewModel.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import Foundation

final class SavedLocationsViewModel: ObservableObject {

    @Published private(set) var locations: [SearchLocation] = []

    private let savedLocationsService: SavedLocationsServiceProtocol

    init(savedLocationsService: SavedLocationsServiceProtocol) {
        self.savedLocationsService = savedLocationsService
    }

    func onAppear() {
        locations = savedLocationsService.fetchAll()
    }

    func delete(_ location: SearchLocation) {
        savedLocationsService.delete(withId: location.id)
        locations = savedLocationsService.fetchAll()
    }
}
