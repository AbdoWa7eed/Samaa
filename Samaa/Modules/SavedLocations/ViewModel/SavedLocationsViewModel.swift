//
//  SavedLocationsViewModel.swift
//  Samaa
//
//  Created by Abdelrahman on 07/06/2026.
//

import Foundation
import Combine

@MainActor
final class SavedLocationsViewModel: ObservableObject {

    @Published private(set) var locations: [SearchLocation] = []

    private let savedLocationsService: SavedLocationsServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    init(savedLocationsService: SavedLocationsServiceProtocol) {
        self.savedLocationsService = savedLocationsService
        setupBindings()
    }

    private func setupBindings() {
        savedLocationsService.fetchAll()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] updatedLocations in
                self?.locations = updatedLocations
            }
            .store(in: &cancellables)
    }

    @MainActor func delete(_ location: SearchLocation) {
        savedLocationsService.delete(withId: location.id)
    }
}
